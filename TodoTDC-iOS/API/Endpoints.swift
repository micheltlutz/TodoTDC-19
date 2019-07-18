//
//  Endpoints.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 02/06/19.
//

import Foundation

enum Endpoints: String {
    private static let base = "http://192.168.1.140:8080/"
    case category = "category/"
    case todos = "todos/"
    
    var url: String {
        return Endpoints.base + self.rawValue
    }
}
