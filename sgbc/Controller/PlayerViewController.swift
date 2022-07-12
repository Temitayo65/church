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
    var sermonUpdate = Sermon()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        sermonImage.image = UIImage(named: sermonUpdate.imageName)
        sermonImage.layer.cornerRadius = 20
        sermonTitle.text = sermonUpdate.title
        sermonTitle.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        preacherTitle.text = sermonUpdate.preacher
        preacherTitle.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.backgroundColor = UIColor(red: 0.27, green: 0.37, blue: 0.46, alpha: 1.0)
        
    }
    
    @IBAction func playAudio(_ sender: Any) {
        print("The audio is being played")
        print("The audio being played is \(sermonUpdate.title)")
        
    }


}
