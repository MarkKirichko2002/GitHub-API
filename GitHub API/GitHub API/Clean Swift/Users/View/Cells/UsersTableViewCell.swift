//
//  UsersTableViewCell.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import UIKit
import SDWebImage

class UsersTableViewCell: UITableViewCell {

    static let identifier = "UsersTableViewCell"
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserLogin: UILabel!
    @IBOutlet weak var UserID: UILabel!
    
    func configure(users: UsersViewModel) {
        UserImage.sd_setImage(with: URL(string: users.image))
        UserImage.layer.cornerRadius = UserImage.frame.width / 2
        UserImage.layer.borderWidth = 5
        UserLogin.text = users.login
        UserID.text = "\(users.id)"
    }
    
}
