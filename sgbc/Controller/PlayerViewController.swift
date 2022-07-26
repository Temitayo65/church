//
//  PlayerViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var segmentChoice: UISegmentedControl!
    @IBOutlet weak var sermonImage: UIImageView!
    @IBOutlet weak var sermonTitle: UILabel!
    @IBOutlet weak var preacherTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var sermonUpdate: Any = ""
    var sermonGetter = SermonManager() // trying out the sermon manager - still needs updating / refactoring
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    var PlayButtonIsOff: Bool = false
    var timeBeingPlayed: Double!
    
    // For Playing sounds
    var audioFile: AVAudioFile!
    var audioEngine:AVAudioEngine = AVAudioEngine()
    var audioPlayerNode = AVAudioPlayerNode()
    // var audioEngine:AVAudioEngine!
    //var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.27, green: 0.37, blue: 0.46, alpha: 1.0)
        setLoadView(data: sermonUpdate)
        setupAudio() // audio is setup once view is loaded 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func playAudio(_ sender: Any) {
        // Testing out the feature of the sermon manager
        // let url = URL(string: "https://sgbc.ams3.digitaloceanspaces.com/Audio/March-2021/Steadfastness-in-Church-Membership.mp3?AWSAccessKeyId=C663TNSAPB6NR24LMYTF&Expires=1658774453&Signature=vLMh6EhCLf4xojH4ojydWplS0YA%3D")
        /* Handle any work that's necessary after playback. */
        if !PlayButtonIsOff  || !audioEngine.isRunning{
            print("Now playing")
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            PlayButtonIsOff = true
            playSound(rate: 1.0, pitch: nil, echo: false, reverb: false)
            
        }
        else if PlayButtonIsOff && audioEngine.isRunning{
            print("Pausing the Play")
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            PlayButtonIsOff = false
            pauseAudio()
        }
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


