//
//  ProfileViewController.swift
//  sgbc
//
//  Created by ADMIN on 15/07/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func signUpTapped(_ sender: Any) {
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = UIImage(named:"profile")
        signInButton.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1)
    }
    

 
}
