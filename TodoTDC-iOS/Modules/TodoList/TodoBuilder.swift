//
//  TodoBuilder.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import UIKit

final class TodosBuilder: GenericListBuilder {
    
    func makeViewController() -> UIViewController {
        let repository = TodosRepository()
        let presenter = TodosListPresenter(repository: repository)
        let viewController = TodosListViewController(presenter: presenter)
        
        return viewController
    }
    
}
