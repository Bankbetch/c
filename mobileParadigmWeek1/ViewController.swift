//
//  ViewController.swift
//  mobileParadigmWeek1
//
//  Created by Bank on 9/1/2562 BE.
//  Copyright © 2562 Bank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable:UILabel!
    @IBOutlet weak var updateLableScore:UILabel!
    @IBOutlet weak var targetRound:UILabel!
    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        
        let tumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(tumbImageNormal, for: .normal)
        let thumbImageHeighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHeighlighted, for: .highlighted)
        
        let inserts = UIEdgeInsets(top: 0, left: 14, bottom: 0,right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: inserts)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: inserts)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = Int.random(in: 1...100)
        updateLables()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showAlert(){
      //  var difference = currentValue - targetValue
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        round += 1
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            score += 100
        } else if difference < 5{
            title = "You almost had it!"
            score += 50
        }else if difference < 10{
            title = "Pretty good!"
        }
        else{
            title = "Not even close..."
            score -= 100
        }
        
        let message = "You scored \(points) points"
        
        /*if currentValue > targetValue {
            difference = currentValue - targetValue
        }else if targetValue > currentValue{
            difference = targetValue - currentValue
        }else{
            difference = 0
        }
 */
//        if difference < 0{
//            difference = difference * -1
//        }
        
//        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "/nThe difference is: \(difference)"
        
        let alert = UIAlertController(title:title,message:message,preferredStyle: .alert)
        
        let action = UIAlertAction(title:"OK",style:.default,handler:{action in self.reset()})
        
      //  let action = UIAlertAction(title:"OK",style:.default,handler:{ _ in self.reset()})
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
        
       // startNewRound()
    }
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)
    }
    @IBAction func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        score = 0
        round = 0
        updateLables()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition,forKey: nil)
    }
    func updateLables(){
        targetLable.text = String(targetValue)
        updateLableScore.text = String(score)
        targetRound.text = String(round)
    }
    func reset(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLables()
    }
 
}

