//
//  PlayerViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var segmentChoice: UISegmentedControl!
    @IBOutlet weak var sermonImage: UIImageView!
    @IBOutlet weak var sermonTitle: UILabel!
    @IBOutlet weak var preacherTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    var sermonUpdate: Any = ""
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.27, green: 0.37, blue: 0.46, alpha: 1.0)
        setLoadView(data: sermonUpdate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func playAudio(_ sender: Any) {
        print("The audio is being played")
        
    }
    
    
    func setLoadView(data dataToLoad: Any){
    
        if dataToLoad is Sermon{
            let data = dataToLoad as! Sermon
            sermonImage.image = UIImage(named: data.imageName)
            sermonImage.layer.cornerRadius = 20
            sermonTitle.text = data.title
            sermonTitle.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            preacherTitle.text = data.preacher
            preacherTitle.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        else if dataToLoad is Podcast{
            let data = dataToLoad as! Podcast
            sermonImage.image = UIImage(named: data.podcastImageName)
            sermonImage.layer.cornerRadius = 20
            sermonTitle.text = data.podcastTitle
            sermonTitle.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            preacherTitle.text = "SGBC"
            preacherTitle.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        }
        
    }


}
