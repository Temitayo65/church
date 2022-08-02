//
//  PlayerViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit
import SwiftAudio
import AVFAudio

class PlayerViewController: UIViewController {

    @IBOutlet weak var segmentChoice: UISegmentedControl!
    @IBOutlet weak var sermonImage: UIImageView!
    @IBOutlet weak var sermonTitle: UILabel!
    @IBOutlet weak var preacherTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var audioProgressView: UIProgressView!
    
    var sermonUpdate: Any = ""
    var sermonGetter = SermonManager() // trying out the sermon manager - still needs updating / refactoring
    var player: AudioPlayer!
    var playIsOn: Bool = false
    var playerIsLoaded: Bool = false
    var audioItem: DefaultAudioItem!
    var copiedURL: String = ""
    var currentURL: String! // this will be passed from the tableview when tapped


    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.27, green: 0.37, blue: 0.46, alpha: 1.0)
        setLoadView(data: sermonUpdate) // what does this do ?
        
        
        player = AudioPlayer()
        player.timeEventFrequency = .everySecond
        player.event.updateDuration.addListener(self, handleAudioPlayerTimeEvent)
        
        // player.event.stateChange.addListener(self, handleAudioPlayerStateChange)
        
        
        // The audioitem here then becomes the currentURL loaded from the tap on the table cell
        // This will be compared to the copiedURL inherent in the tableViewController
        // The comparison will be such that if they are same, then nothing new is loaded
        // else, the previous audio player session will be stopped and something new will be loaded
        /*
         
         if copiedURL != currentURL{
         audioItem = DefaultAudioItem(audioUrl: currentURL, sourceType: .stream)
         }
         
         */
        audioItem = DefaultAudioItem(audioUrl: "https://sgbc.ams3.digitaloceanspaces.com/January-2021/Assurance-of-Having-Eternal-Life-2021-01-03.mp3?AWSAccessKeyId=C663TNSAPB6NR24LMYTF&Expires=1659451449&Signature=c9QYAgQUMKimffUwr19wV%2BvCSvk%3D", sourceType: .stream)
        print(player.currentTime)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func handleAudioPlayerStateChange(state: AudioPlayerState) {
        
//        DispatchQueue.main.async {
//            [self] in
//            self.player.rate = 2.0
//            self.player.updateNowPlayingPlaybackValues()
//        }
            // Handle the event
        switch state {
        case .buffering:
            print("Audio is still buffering")
            return
        case .playing:
            print("Audio is still playing")
            return
        case .paused:
            print("Audio has been paused")
            return
            
        case .idle:
            print("Engine is idle")
            return
        case .ready:
            print("Engine is ready to start")
            return
        case .loading:
            print("Engine is loading")
            return
        }
        
    }
    
    func handleAudioPlayerTimeEvent(event: AudioPlayer.UpdateDurationEventData){
        print("The current time is: ", player.currentTime)
        print("The duration is: ", player.duration)
        print("The fraction is: ", player.currentTime/player.duration)
        DispatchQueue.main.async { [self] in
            self.audioProgressView.setProgress(Float(self.player.currentTime/self.player.duration), animated: true)
            
        }
        
        
    }
    
    @IBAction func playAudio(_ sender: Any) {
        player.event.stateChange.addListener(self, handleAudioPlayerStateChange)
        player.event.updateDuration.addListener(self, handleAudioPlayerTimeEvent)
        
        if !playerIsLoaded{
            try! player.load(item: audioItem, playWhenReady: true)
            player.play()
            playerIsLoaded = true
        }
        if !playIsOn{
            player.play()
            playIsOn = true
        }
        else{
            player.pause()
            playIsOn = false
        }
        
    
    }
    
    @IBAction func rateButtonPressed(_ sender: UIButton) {
        // write logic to increase rate here. This should affect whatis in the DispatchQueue.main.async
        
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


