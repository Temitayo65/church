//
//  PlayerViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit
import SwiftAudio
import AVFAudio
import AVFoundation
public var gloabalClickedRow: Int = -1
public var globalPlayerState: AudioPlayerState = .idle
public var globalAudioPlayer = AudioPlayer()

class PlayerViewController: UIViewController {
    
    
    @IBOutlet weak var segmentChoice: UISegmentedControl!
    @IBOutlet weak var sermonImage: UIImageView!
    @IBOutlet weak var sermonTitle: UILabel!
    @IBOutlet weak var preacherTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var audioProgressView: UIProgressView!
    
    var sermonUpdate: Any = ""
    var sermonGetter =  SermonManager()
    var player: AudioPlayer!
    var audioItem: DefaultAudioItem!
    var currentURL: String = "" // this will be passed from the tableview when tapped
    var indexTapped: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.27, green: 0.37, blue: 0.46, alpha: 1.0)
        setLoadView(data: sermonUpdate)
        player = AudioPlayer()
        player.timeEventFrequency = .everySecond
        player.event.updateDuration.addListener(self, handleAudioPlayerTimeEvent)
        print("The value of the clicked row is", gloabalClickedRow)
        print("This is the current URL that was passed", currentURL)
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
            print("Audio is  buffering")
            return
        case .playing:
            print("Audio is  playing")
            return
        case .paused:
            print("Audio is paused")
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
        DispatchQueue.main.async { [self] in
            self.audioProgressView.setProgress(Float(self.player.currentTime/self.player.duration), animated: true)
        }
    }
    
    func changeUIOnButtonClick(){
        let playerState = player.playerState
        if playerState == .playing{
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
        else{
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
        
    }
    
    @IBAction func playAudio(_ sender: Any) {
        player.event.stateChange.addListener(self, handleAudioPlayerStateChange)
        player.event.updateDuration.addListener(self, handleAudioPlayerTimeEvent)
        let playerState = player.playerState
        print("This is the player state:", playerState)
        print("The current url is", currentURL)
        
        if globalPlayerState == .idle{
            print("Starting out initially")
            globalPlayerState = .playing
            gloabalClickedRow = indexTapped
            changeUIOnButtonClick()
            loadAudio()
            player.play()
        }
        else if globalPlayerState == .playing && indexTapped == gloabalClickedRow{
            print("Pausing after having started")
            changeUIOnButtonClick()
            globalPlayerState = .paused
            print("Global row on click", gloabalClickedRow)
            player.pause()
        }
        else if globalPlayerState == .paused && indexTapped == gloabalClickedRow{
            print("Playing after having paused")
            changeUIOnButtonClick()
            globalPlayerState = .playing
            player.play()
        }
        else if globalPlayerState == .playing && indexTapped != gloabalClickedRow{
            print("Audio has been changed because of different row click and is now playing new audio")
            changeUIOnButtonClick()
            player.stop()
            loadAudio()
            gloabalClickedRow = indexTapped
            player.play()
        }
        else if globalPlayerState == .paused && indexTapped != gloabalClickedRow{
            print("Audio has been changed because of different row click with previous audio paused and is now playing new audio")
            changeUIOnButtonClick()
            player.stop()
            loadAudio()
            gloabalClickedRow = indexTapped
            player.play()
        }
        
    }
    
    
    func loadAudio(){
        audioItem = DefaultAudioItem(audioUrl: self.currentURL, sourceType: .stream)
        try! player.load(item: audioItem, playWhenReady: true)
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

    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


