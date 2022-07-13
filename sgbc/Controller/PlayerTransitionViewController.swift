//
//  PlayerTransitionViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit


class PlayerTransitionViewController: UIViewController {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var transitionImageView: UIImageView!
    @IBOutlet weak var synopsisLogoImageView: UIImageView!
    @IBOutlet weak var synopsisTextLabel: UILabel!
    @IBOutlet weak var sermonTitleLabel: UILabel!
    @IBOutlet weak var preacherTitleLabel: UILabel!
    
    var sermonUpdate: Sermon = Sermon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bottomView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        transitionImageView.layer.masksToBounds = true
        transitionImageView.layer.cornerRadius = 20
        transitionImageView.image = UIImage(named: sermonUpdate.imageName)
        synopsisTextLabel.text = sermonUpdate.synopsis
        synopsisTextLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        synopsisLogoImageView.image = UIImage(named: "synopsis")
        preacherTitleLabel.text = sermonUpdate.preacher
        preacherTitleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        sermonTitleLabel.text = sermonUpdate.title
        sermonTitleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayingSermonIdentifier" {
            let playerTransitionVC = segue.destination as! PlayerViewController
            playerTransitionVC.sermonUpdate = sermonUpdate
        }
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "PlayingSermonIdentifier", sender: self)
    }
    


}
