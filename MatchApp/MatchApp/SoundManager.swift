//
//  SoundManager.swift
//  MatchApp
//
//  Created by James Wilhelm on 3/15/22.
//  Copyright © 2022 wilhelm. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager{
    var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect{
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect:SoundEffect){
        var soundFilename = ""
        
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        case .shuffle:
            soundFilename = "shuffle"
        }
       let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: ".wav")
        
        if bundlePath == nil{
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("couldn't create an audio player")
            return
        }
       
    }
}
