//
//  TapMe.swift
//  Animation
//
//  Created by hi on 15/10/14.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit
import AVFoundation

class TapMe: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
   
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
    // sound
    var buttonBeep:AVAudioPlayer?
    var secondBeep:AVAudioPlayer?
    var backgroundMusic:AVAudioPlayer?
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("Button Pressed")
        count++
        scoreLabel.text = "Score: \(count)"
        buttonBeep?.play()
    }
    
    func setupGame() {
        seconds = 30
        count = 0
        timeLabel.text = "Timer:\(seconds)"
        scoreLabel.text = "Score:\(count)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
        backgroundMusic?.volume = 0.3
        backgroundMusic?.play()
        
    }
    func subtractTime() {
        seconds--
        count++
        timeLabel.text = "Time:\(seconds)"
        scoreLabel.text = "Score:\(count)"
        secondBeep?.play()

        if (seconds == 0) {
            timer.invalidate()
            let alter = UIAlertController(title: "Time is up", message: "You scored\(count) points", preferredStyle: UIAlertControllerStyle.Alert)
            alter.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
               action  in self.setupGame()
            }))
            presentViewController(alter, animated: true, completion: nil)
            
        }
    }
    
    
    // sound
    func setupAudioPlayWithFile(file:String,type:String) -> AVAudioPlayer? {
        // 1
        let path = NSBundle.mainBundle().pathForResource(file, ofType: type)
        let url  = NSURL.fileURLWithPath(path!)
        
        // 2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
        return audioPlayer
    }
    // life cycle
    override func viewDidLoad() {
        setupGame()
        view.backgroundColor = UIColor(red: 60/255.0, green: 60/255.0, blue: 60/255.0, alpha: 1)
        if let buttonBeep = self.setupAudioPlayWithFile("ButtonTap", type: "wav") {
            self.buttonBeep = buttonBeep
        }
        if let secondBeep = self.setupAudioPlayWithFile("SecondBeep", type:"wav") {
            self.secondBeep = secondBeep
        }
        if let backgroundMusic = self.setupAudioPlayWithFile("HallOfTheMountainKing", type:"mp3") {
            self.backgroundMusic = backgroundMusic
        }
    }
}
