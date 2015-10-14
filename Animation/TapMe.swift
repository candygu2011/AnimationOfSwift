//
//  TapMe.swift
//  Animation
//
//  Created by hi on 15/10/14.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit

class TapMe: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
   
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("Button Pressed")
        count++
        scoreLabel.text = "Score: \(count)"
    }
    
    func setupGame() {
        seconds = 10
        count = 0
        timeLabel.text = "Timer:\(seconds)"
        scoreLabel.text = "Score:\(count)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
        
    }
    func subtractTime() {
        seconds--
        count++
        timeLabel.text = "Time:\(seconds)"
        scoreLabel.text = "Score:\(count)"

        if (seconds == 0) {
            timer.invalidate()
            let alter = UIAlertController(title: "Time is up", message: "You scored\(count) points", preferredStyle: UIAlertControllerStyle.Alert)
            alter.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
               action  in self.setupGame()
            }))
            presentViewController(alter, animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        setupGame()
    }
}
