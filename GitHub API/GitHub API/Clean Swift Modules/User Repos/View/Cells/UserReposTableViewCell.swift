//
//  UserReposTableViewCell.swift
//  GitHub API
//
//  Created by Марк Киричко on 11.10.2022.
//

import UIKit

class UserReposTableViewCell: UITableViewCell {

    static let identifier = "UserReposTableViewCell"
    
    @IBOutlet weak var RepoName: UILabel!
    @IBOutlet weak var RepoDescription: UILabel!
    @IBOutlet weak var RepoLanguage: UILabel!
    
    func configure(repo: UserReposViewModel) {
        RepoName.text = "\(repo.name) (\(repo.language))"
        RepoDescription.text = repo.description
    }
    
}
