//
//  TodosListViewController.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import Foundation
import UIKit

final class TodosListViewController: UIViewController {
    private lazy var dataSource = [Todo]()
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        view.backgroundColor = .clear
//        view.separatorStyle = .none
        view.allowsSelection = false
//        view.rowHeight = 60
        return view
    }()
    
    private let refreshControl = UIRefreshControl()
    private lazy var navigationTitleLabel = UILabel()
    
    private let presenter: TodosListPresenter
    
    init(presenter: TodosListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        self.definesPresentationContext = true
        tableView.delegate = self
        tableView.dataSource = self
        presenter.viewDidLoad(self)
        setupViewConfiguration()
    }
    
    private func setupNavigationButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
    }
    
    private func setupRefreshControl() {
        refreshControl.tintColor = .white
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshTriggered), for: .valueChanged)
    }
    
    @objc private func refreshTriggered() {
        presenter.refreshControlTriggered()
    }
}

// MARK: Table View protocols

extension TodosListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //@TODO Adicionar presenter de cell
        cell.textLabel?.text = dataSource[indexPath.row].title
        
        return cell
    }
}


// MARK: Public methods

extension TodosListViewController: GenericListView {
    func showLoading() {
        LoadingManager.show(Loader(frame: .zero), in: self)
    }
    
    func removeLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl.endRefreshing()
        }
        
        LoadingManager.hide()
    }
    
    func updateList(todos: [Todo]) {
        dataSource = todos
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
        
    }
    
    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func addTodo() {
        let alert = UIAlertController(title: "Adicionar Todo", message: "Informe o título da Todo", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "Título"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            print("Text field: \(textField?.text)")
            self.createItem(text: (textField?.text!)!)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func createItem(text: String) {
        let category = Category(id: 1, title: "Pessoal", color: "#8e44ad")
        let todo = Todo(title: text,
                        category: category)
        self.presenter.persistData(todo: todo)
    }
}

extension TodosListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }
        presenter.searchFieldTriggered(text)
    }
}


// MARK: Views Configuration


extension TodosListViewController: ViewConfiguration {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor  ),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func buildViewHierarchy() {
        setupNavigationButton()
        setupRefreshControl()
        view.addSubview(tableView)
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
    
}
