//
//  UserReposTableViewController.swift
//  GitHub API
//
//  Created by Марк Киричко on 10.10.2022.
//

import Foundation
import UIKit

protocol UserReposDisplayLogic: class {
    func displayData(viewModel: UserReposModelsEnum.Model.ViewModel.ViewModelData)
}

class UserReposTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repos = [UserReposViewModel]()
    private var interactor: UserReposBusinessLogic?
    var presenter: UserReposPresentationLogic?
    private(set) var router: (UserReposRoutingLogic & UserReposDataPassing)?
    
    private func setup() {
        let viewController = self
        let interactor = UserReposInteractor()
        let presenter = UserReposPresenter()
        let router = UserReposRouter()
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        interactor?.GetUserRepos(request: .GetUserRepos)
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "UserReposTableViewCell", bundle: nil), forCellReuseIdentifier: UserReposTableViewCell.identifier)
    }
    
}

extension UserReposTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserReposTableViewCell.identifier, for: indexPath) as! UserReposTableViewCell
        cell.configure(repo: repos[indexPath.row])
        return cell
    }
    
}

extension UserReposTableViewController: UserReposDisplayLogic {
    func displayData(viewModel: UserReposModelsEnum.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayUserRepos(let userReposViewModel):
            DispatchQueue.main.async {
                print(self.repos)
                self.repos = userReposViewModel
                self.tableView.reloadData()
            }
        }
    }
}

extension UserReposTableViewController: UserReposRoutingLogic {
    func navigateToRepoInfo(login: String) {
        
    }
}
