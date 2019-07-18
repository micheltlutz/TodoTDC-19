//
//  TodoRepository.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import Foundation

final class TodosRepository: GenericListRepositoryInput {
    var output: GenericListRepositoryOutput?
    private let apiHandler = API()
    
    func requestData() {
        apiHandler.request(url: [.todos], httpMethod: .get, body: nil) { [output] (response: [Todo]?, error: String?) in
            guard error == nil else {
                output?.requestFailed(error: error ?? "Erro inesperado")
                return
            }
            guard let response = response else {
                output?.requestFailed(error: "Houve um problema a processar a sua nota, tente novamente dentro de alguns minutos.")
                return
            }
            print("RESPONSE TODOS")
            dump(response)
            output?.requestSucceeded(todos: response)
        }
    }
    
    func persistData(todo: Todo) {
        apiHandler.request(url: [.todos], httpMethod: .post, body: todo) { [output] (response: [Todo]?, error: String?) in
            guard error == nil else {
                output?.requestFailed(error: error ?? "Erro inesperado")
                return
            }
            guard let response = response else {
                output?.requestFailed(error: "Houve um problema a processar a sua nota, tente novamente dentro de alguns minutos.")
                return
            }
            print("RESPONSE persistData TODOS")
            dump(response)
            output?.requestSucceeded(todos: response)
        }
    }
}
