//
//  API.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 02/06/19.
//

import Foundation


enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum HttpResponse {
    case success
    case error
}

/**
 Implements partial Swift_GenericAPILayer
 @see https://github.com/victorpanitz/Swift_GenericAPILayer
 */
final class API {
    func request<T: Decodable>(url: [Endpoints], httpMethod: HttpMethod, body: Encodable?, completion: @escaping(T?,String?) -> ()) {
        guard let request = makeRequest(
            url: url,
            method: httpMethod, body: body) else { return }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil, "Erro inesperado, aguarde um instante e tente novamente.")
                return
            }
            switch response.statusCode {
            case 400..<600:
                completion(nil, "Erro \(response.statusCode) \(String(describing: error))")
            default:
                guard let data = data else { return }
                
                print("DATA")
                print(data.toString())
                
                do  {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(object, nil)
                } catch let jsonError {
                    #warning("tratamento a nível de desenvolvimento")
                    completion(nil, "ERRO JSON \(jsonError.localizedDescription) \(response.statusCode)")
                }
            }
        }.resume()
    }
    
    private func makeRequest(url: [Endpoints], method: HttpMethod, body: Encodable?) -> URLRequest? {
        let currentUrl = url.reduce("") { $0 + $1.url }
        guard let url = URL(string: currentUrl) else { return nil }
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadRevalidatingCacheData,
            timeoutInterval: 10
        )
        
        body.map { request.httpBody = $0 as? Data }
        dump(request.httpBody)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        return request
    }
}

extension Data {
    func toString() -> String {
        return (String(data: self, encoding: .utf8)?.replacingOccurrences(of: "\\/", with: ""))!
    }
    
    func toBase64() -> String {
        return self.base64EncodedString()
    }
}
