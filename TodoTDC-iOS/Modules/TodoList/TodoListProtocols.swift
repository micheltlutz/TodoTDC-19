//
//  TodoListProtocols.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import UIKit

protocol GenericListBuilder: class {
    func makeViewController() -> UIViewController
}

protocol GenericListRepositoryOutput {
    func requestFailed(error: String)
    func requestSucceeded(todos: [Todo])
}

protocol GenericListRepositoryInput: class {
    var output: GenericListRepositoryOutput? {get set}
    
    func requestData()
    func persistData(todo: Todo)
}

protocol GenericListView: class {
    func showLoading()
    func removeLoading()
    func updateList(todos: [Todo])
    func createItem(text: String)
    func showError(title: String, message: String)
//    func showTabBar()
//    func hideTabBar()
}
