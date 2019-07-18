//
//  TodosListPresenter.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import Foundation

final class TodosListPresenter {
    
    private let repository: GenericListRepositoryInput
    private weak var view: GenericListView?
    private lazy var todos = [Todo]()
    
    init(repository: GenericListRepositoryInput) {
        self.repository = repository
        repository.output = self
    }
    
    func viewDidLoad(_ view: GenericListView) {
        self.view = view
        askForData()
    }
    
    func refreshControlTriggered() {
        askForData()
    }
    
//    func scrollViewWillDidBeginDragging(scrollValue: Float) {
//        scrollValue > 0 ? view?.hideTabBar() : view?.showTabBar()
//    }
    
    func searchFieldTriggered(_ text: String) {
        text.isEmpty
            ? view?.updateList(todos: todos)
            : view?.updateList(todos: todos.filter {$0.title.uppercased().contains(text.uppercased()) })
    }
    
    private func askForData() {
        view?.showLoading()
        repository.requestData()
    }
    
    func persistData(todo: Todo) {
        repository.persistData(todo: todo)
    }
}

extension TodosListPresenter : GenericListRepositoryOutput {
    func requestSucceeded(todos: [Todo]) {
        view?.removeLoading()
        view?.updateList(todos: todos)
    }
    
    func requestFailed(error: String) {
        view?.removeLoading()
        view?.showError(title: "Ops", message: error)
    }
}
