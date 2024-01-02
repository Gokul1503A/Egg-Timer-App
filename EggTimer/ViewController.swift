//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let hardnessTimes = ["Soft" : 10, "Medium" : 20, "Hard" : 30]
    
    var times = 60
    var timer = Timer()
    var ssecondsPassed = 0
    var  player : AVAudioPlayer!

    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func Hardness(_ sender: UIButton) {
            
        let hardness = sender.currentTitle!
        ssecondsPassed = 0
        Label.text = hardness

        times   = hardnessTimes[hardness]!
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0 , target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var Label: UILabel!
    @objc func updateTime ()
    {
        
        if (ssecondsPassed < times)
        {
            print("\(ssecondsPassed) seconds remaining")
            ssecondsPassed = ssecondsPassed + 1
            var perce = Float(ssecondsPassed)/Float(times)
            progressBar.progress = perce
            

        }
        if (times == ssecondsPassed)
        {
            Label.text = "Cooking Done"
            timer.invalidate()
            playe()
        }
    }
    func playe ()
    {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
