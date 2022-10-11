//
//  UsersTableViewCell.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import UIKit
import SDWebImage

protocol UserCellDelegate: class {
    func didUserTap(login: String)
}

class UsersTableViewCell: UITableViewCell {

    static let identifier = "UsersTableViewCell"
    
    weak var delegate: UserCellDelegate?
    private var login: String?
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserLogin: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didNextTap(_ sender: UIButton) {
        guard let login = login else {return}
        delegate?.didUserTap(login: login)
    }
    
    func configure(users: UsersViewModel) {
        login = users.login
        UserImage.sd_setImage(with: URL(string: users.image))
        UserImage.layer.cornerRadius = UserImage.frame.width / 2
        UserImage.layer.borderWidth = 5
        UserLogin.text = users.login
    }
    
}
