//
//  ViewController.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func GoToApp() {
        let storyboard = UIStoryboard.init(name: "UsersViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "UsersViewController") as? UsersViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

