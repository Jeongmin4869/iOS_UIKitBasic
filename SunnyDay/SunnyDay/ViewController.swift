//
//  ViewController.swift
//  SunnyDay
//
//  Created by 이정민 on 2025/04/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = "맑음"
        let temperature = 17
        
        if weather == "맑음"{
            weatherImageView.image = UIImage(named: "sun")
        } else if weather == "비" {
            weatherImageView.image = UIImage(named: "umbrella")
        }
        
        statusLabel.text = weather
        temperatureLabel.text = "\(temperature)"
    }


}

