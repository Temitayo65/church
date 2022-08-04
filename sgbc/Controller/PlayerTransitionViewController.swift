//
//  PlayerTransitionViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit


class PlayerTransitionViewController: UIViewController, SermonManagerDelegate {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var transitionImageView: UIImageView!
    @IBOutlet weak var synopsisLogoImageView: UIImageView!
    @IBOutlet weak var synopsisTextLabel: UILabel!
    @IBOutlet weak var sermonTitleLabel: UILabel!
    @IBOutlet weak var preacherTitleLabel: UILabel!
    
    var sermonUpdate: Sermon = Sermon()
    var dataFromSearch : Any = ""
    var indexTapped: Int!
    var sermonGetter =  SermonManager()
    var currentURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bottomView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        sermonGetter.delegate = self
        sermonGetter.fetchSermons(index: self.indexTapped)
        
        if dataFromSearch is Sermon{
            let dataToSet = dataFromSearch as! Sermon
            setLoadView(data: dataToSet)
        }
        else if dataFromSearch is Podcast{
            let dataToSet = dataFromSearch as! Podcast
            setLoadView(data: dataToSet)
        }
        else{
            let dataToSet = sermonUpdate
            setLoadView(data: dataToSet)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        if dataFromSearch is Sermon{
            let dataToSet = dataFromSearch as! Sermon
            setLoadView(data: dataToSet)
        }
        else if dataFromSearch is Podcast {
            let dataToSet = dataFromSearch as! Podcast
            setLoadView(data: dataToSet)
        }
        else{
            let dataToSet = sermonUpdate
            setLoadView(data: dataToSet)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayingSermonIdentifier" {
            let playerTransitionVC = segue.destination as! PlayerViewController
            playerTransitionVC.indexTapped = indexTapped // watch out for this in search
            if dataFromSearch is Sermon{
                let data = dataFromSearch as! Sermon
                playerTransitionVC.sermonUpdate = data
                playerTransitionVC.currentURL = self.currentURL
                
            }
            else if dataFromSearch is Podcast{
                let data = dataFromSearch as! Podcast
                playerTransitionVC.sermonUpdate = data
                 playerTransitionVC.currentURL = self.currentURL
            }
            else{
                playerTransitionVC.sermonUpdate = sermonUpdate
                 playerTransitionVC.currentURL = self.currentURL
               
            }
        }
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
            self.performSegue(withIdentifier: "PlayingSermonIdentifier", sender: self)
    }
    
    @IBAction func downloadButtonPressed(_ sender: Any) {
        
    }
    @IBAction func shareButttonPressed(_ sender: Any) {
        
    }
    
    
    func setLoadView(data dataToLoad: Any){
        if dataToLoad is Sermon{
        let sermon = dataToLoad as! Sermon
        transitionImageView.layer.masksToBounds = true
        transitionImageView.layer.cornerRadius = 20
        transitionImageView.image = UIImage(named: sermon.imageName)
        synopsisTextLabel.text = sermon.synopsis
        synopsisTextLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        synopsisLogoImageView.image = UIImage(named: "synops")
        preacherTitleLabel.text = sermon.preacher
        preacherTitleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        sermonTitleLabel.text = sermon.title
        sermonTitleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        }
        else if dataToLoad is Podcast{
        let podcast = dataToLoad as! Podcast
        transitionImageView.layer.masksToBounds = true
        transitionImageView.layer.cornerRadius = 20
        transitionImageView.image = UIImage(named: podcast.podcastImageName)
        synopsisTextLabel.text = "We pray you be Blessed as You Listen"
        synopsisTextLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        synopsisLogoImageView.image = UIImage(named: "synops")
        preacherTitleLabel.text = "SGBC"
        preacherTitleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        sermonTitleLabel.text = podcast.podcastTitle
        sermonTitleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        }
    }
    
    func didUpdateSermonData(sermonDatas: String) {
        DispatchQueue.main.async {
            self.currentURL = sermonDatas
        }
    }


}
