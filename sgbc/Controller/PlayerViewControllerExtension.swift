//
//  PlayerViewControllerExtension.swift
//  sgbc
//
//  Created by ADMIN on 26/07/2022.
//

import UIKit
import AVFoundation

// MARK: - PlayerViewController: AVAudioPlayerDelegate

extension PlayerViewController: AVAudioPlayerDelegate {
    
    struct Alerts {
        static let DismissAlert = "Dismiss"
        static let RecordingDisabledTitle = "Recording Disabled"
        static let RecordingDisabledMessage = "You've disabled this app from recording your microphone. Check Settings."
        static let RecordingFailedTitle = "Recording Failed"
        static let RecordingFailedMessage = "Something went wrong with your recording."
        static let AudioRecorderError = "Audio Recorder Error"
        static let AudioSessionError = "Audio Session Error"
        static let AudioRecordingError = "Audio Recording Error"
        static let AudioFileError = "Audio File Error"
        static let AudioEngineError = "Audio Engine Error"
    }
    
    func playSound(rate: Float? = nil, pitch: Float? = nil, echo: Bool = false, reverb: Bool = false) {
        if !audioEngine.isRunning {
        // initialize audio engine components
        // audioEngine = AVAudioEngine()
        
        // node for playing audio
        // audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)
        
        // node for adjusting rate/pitch
        let changeRatePitchNode = AVAudioUnitTimePitch()
        if let rate = rate {
            changeRatePitchNode.rate = rate
        }
        
        // attach nodes to audioEngine
        audioEngine.attach(changeRatePitchNode)
        
        // connect nodes
        connectAudioNodes(audioPlayerNode, changeRatePitchNode, audioEngine.outputNode)

        
        // schedule to play and start the engine!
        // audioPlayerNode.stop()
        audioPlayerNode.scheduleFile(audioFile, at: nil) {
            
            var delayInSeconds: Double = 0
            
            if let lastRenderTime = self.audioPlayerNode.lastRenderTime, let playerTime = self.audioPlayerNode.playerTime(forNodeTime: lastRenderTime) {
                
                if let rate = rate {
                    delayInSeconds = Double(self.audioFile.length - playerTime.sampleTime) / Double(self.audioFile.processingFormat.sampleRate) / Double(rate)
                } else {
                    delayInSeconds = Double(self.audioFile.length - playerTime.sampleTime) / Double(self.audioFile.processingFormat.sampleRate)
                }
            }
            
            // schedule a stop timer for when audio finishes playing
            self.stopTimer = Timer(timeInterval: delayInSeconds, target: self, selector: #selector(PlayerViewController.stopAudio), userInfo: nil, repeats: false)
            RunLoop.main.add(self.stopTimer!, forMode: RunLoop.Mode.default)
        }
       
       
        do {
            try audioEngine.start()
        } catch {
            showAlert(Alerts.AudioEngineError, message: String(describing: error))
            return
        }
        // play the audio
        audioPlayerNode.play()
    }
        
        else {
            print("Playing from a pause")
            audioPlayerNode.play()
        }

}
    
    
    @objc func stopAudio() {
        print("Stopping Audio")
        audioPlayerNode.stop()
    
    // if let audioPlayerNode = audioPlayerNode{
    //      audioPlayerNode.pause
    // }
        
        if let stopTimer = stopTimer {
            stopTimer.invalidate()
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
        audioEngine.stop()
        audioEngine.reset()
    }
    
    
    @objc func pauseAudio(){
        audioPlayerNode.pause()
    }
    
    // MARK: Connect List of Audio Nodes
    
    func connectAudioNodes(_ nodes: AVAudioNode...) {
        for x in 0..<nodes.count-1 {
            audioEngine.connect(nodes[x], to: nodes[x+1], format: audioFile.processingFormat)
        }
    }
    
    
    
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Alerts.DismissAlert, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupAudio() {
        // initialize (recording) audio file
        do {
            audioFile = try AVAudioFile(forReading: URL(fileURLWithPath: "/Users/admin/Downloads/EMO/mix.wav"))
        } catch {
            showAlert(Alerts.AudioFileError, message: String(describing: error))
        }
    }
    
    
    
}
