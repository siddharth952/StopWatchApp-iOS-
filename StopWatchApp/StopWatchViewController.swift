//
//  StopWatchViewController.swift
//  StopWatchApp
//
//  Created by Siddharth Sen on 09/02/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit

class StopWatchViewController : UIViewController{
    
    //Buttons
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    //Labels
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    @IBAction func resetOnTap(_ sender: Any) {
        
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timeLabel.text = "0:00:00.0"
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        
        
        
    }
    
    @IBAction func startOnTap(_ sender: Any) {
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(RunTheTimer), userInfo: nil, repeats: true)
            isTimerRunning = true;
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
        
    }
    
    @IBAction func pauseOnTap(_ sender: Any) {
        
        resetButton.isEnabled = true
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        isTimerRunning = false
        timer.invalidate()
        
        
        
    }
    
    
    
    
    
    
    @objc func RunTheTimer(){
        counter += 0.1
        // HH:MM:SS:_
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        
        let second = (flooredCounter % 3600 ) % 60
        var secondString = "\(second)"
        if second < 10 {}
        secondString = "0\(second)"
        
        
        let decisecond = String(format: "%.1f",counter).components(separatedBy: ".").last!
        
        timeLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
    }
}
