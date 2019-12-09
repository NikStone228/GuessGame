//
//  ViewController.swift
//  GueesGame
//
//  Created by Nikita on 09/11/2019.
//  Copyright © 2019 Nikita. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

  var currentValue: Int = 0
  @IBOutlet weak var sender: UISlider!
  var targetValue: Int = 0
  @IBOutlet weak var targetLabel: UILabel!
  var score = 0
  @IBOutlet var scoreLabel: UILabel!
  var round = 0
  @IBOutlet var roundLabel: UILabel!
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
    currentValue = lroundf(sender.value)
    startNewRound()
  }

  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }

  func startNewRound() {
    round += 1 
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    sender.value = Float(currentValue)
    updateLabels()
  }

  @IBAction func sliderMoved(_ sender: UISlider) {
    print("The value of slider is now: \(sender.value)")
    currentValue = lroundf(sender.value)
  }

  @IBAction func showAlert() {
    
    var difference: Int = currentValue - targetValue
    if difference < 0 {
        difference = difference * -1
    }
    
    let points = 100 - difference
    
    score += points

    let message = "Your value : \(currentValue)" + "\nYou were close by: \(difference)" + "\nYou scored \(points) points"

    let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)

    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)

    alert.addAction(action)

    present(alert, animated: true, completion: nil)

    startNewRound()

  }

}


