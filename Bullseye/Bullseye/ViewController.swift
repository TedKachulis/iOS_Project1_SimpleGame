//
//  ViewController.swift
//  Bullseye
//
//  Created by Ted Kachulis on 2017-10-26.
//  Copyright © 2017 Ted Kachulis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var curVal: Int = 50
    var targetVal: Int = 0
    var TotalScore = 0
    var RoundNumber = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var RoundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
        // let thumbImageNormal = UIImage(named: "namehere")
        // slider.setThumbImage(thumbImageNormal, for: .normal)
        
        // let thumbImageHighlighted = UIImage(named: "namehere")
        // slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        // let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        // let trackLeftImage = UIImage(named: "namehere")
        // let trackLeftResizeable = trackLeftImage?.resizableImage(withCapInsets: insets)
        // slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        // let trackRightImage = UIImage(named: "namehere")
        // let trackRightResizeable = trackRightImage?.resizableImage(withCapInsets: insets)
        // slider.setMinimumTrackImage(trackRightResizable, for: .normal)
        
    }

    func updateLabels(){
        targetLabel.text = String(targetVal)
        scoreLabel.text = String(TotalScore)
        RoundLabel.text = String(RoundNumber)
    }
    
    func newRound(){
        RoundNumber += 1
        curVal = 50
        targetVal = Int(arc4random_uniform(101))
        slider.value = Float(curVal)
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of the slider is now: \(slider.value)")
        curVal = lroundf(slider.value)
    }
    
    @IBAction func showHitMeAlert(){
        
        let alert = UIAlertController(title: "Good One!", message: "You scored: ", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Continue", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func showSliderAlert(){
       
        let curScore: Int = abs(targetVal - curVal)
        let adjScore = 100 - curScore
        TotalScore = TotalScore + adjScore
        
        let message = "You landed on: \(curVal)"
            + "\n Your goal was: \(targetVal)"
        
        let alert = UIAlertController(title: "You Scored \(adjScore)", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Next Round!", style: .default, handler: {
            action in
            self.newRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func restart(){
        curVal = 50
        targetVal = 0
        TotalScore = 0
        RoundNumber = 0
        newRound()
    }
}

