//
//  UserInfoViewController.swift
//  GitHub API
//
//  Created by Марк Киричко on 30.09.2022.
//

import Foundation
import UIKit
import SDWebImage


protocol UserInfoDisplayLogic: class {
    func displayUserInfo(viewModel: UserInfoModelsEnum.Model.ViewModel.ViewModelData)
}

class UserInfoViewController: UIViewController, UserInfoRoutingLogic {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserLogin: UILabel!
    @IBOutlet weak var ReposButton: UIButton!
    @IBOutlet weak var FollowersButton: UIButton!
    
    private var interactor: UserInfoBusinessLogic?
    var presenter: UserInfoPresentationLogic?
    private(set) var router: (UserInfoRoutingLogic & UserInfoDataPassing)?
    
    @IBAction func navigateToRepos() {
        navigateToRepos(login: router?.dataStore?.login ?? "")
    }
    
    private func setup() {
        let viewController = self
        let interactor = UserInfoInteractor()
        let presenter = UserInfoPresenter()
        let router = UserInfoRouter()
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
    func navigateToRepos(login: String) {
        router?.navigateToRepos(login: login)
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
        interactor?.GetUserInfo(request: .GetUser)
    }
}

extension UserInfoViewController: UserInfoDisplayLogic {
    
    func displayUserInfo(viewModel: UserInfoModelsEnum.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayUserInfo(let userViewModel):
            DispatchQueue.main.async {
                self.UserImage.layer.cornerRadius = self.UserImage.frame.width / 2
                self.UserImage.layer.borderWidth = 5
                self.UserImage.sd_setImage(with: URL(string: userViewModel.image))
                self.UserName.text = userViewModel.name
                self.UserLogin.text = userViewModel.login
                self.ReposButton.setTitle("репозитории: \(userViewModel.repos)", for: .normal)
                self.FollowersButton.setTitle("подписчики: \(userViewModel.followers)", for: .normal)
            }
        }
    }
}

