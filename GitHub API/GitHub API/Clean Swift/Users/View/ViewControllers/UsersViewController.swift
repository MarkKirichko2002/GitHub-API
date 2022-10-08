//
//  View.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation
import UIKit

protocol UsersDisplayLogic: class {
    func displayData(viewModel: UsersModelsEnum.Model.ViewModel.ViewModelData)
}

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var interactor: UsersBusinessLogic?
    var presenter: UsersPresentationLogic?
    private(set) var router: UsersRoutingLogic?
    
    var users = [UsersViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Пользователи GitHub"
        setup()
        configureTableView()
        interactor?.makeRequest(request: .GetUsers)
    }
    
    func setup() {
        let viewController = self
        let interactor = UsersInteractor()
        let presenter = UsersPresenter()
        let router = UsersRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: UsersTableViewCell.identifier)
    }
    
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        cell.configure(users: users[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension UsersViewController: UsersDisplayLogic {
    func displayData(viewModel: UsersModelsEnum.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayUsers(let usersViewModel):
            DispatchQueue.main.async {
                self.users = usersViewModel
                self.tableView.reloadData()
            }
        }
    }
}

extension UsersViewController: UserCellDelegate {
    func didUserTap(login: String) {
         router?.navigateToDetails(login: login)
    }
}
