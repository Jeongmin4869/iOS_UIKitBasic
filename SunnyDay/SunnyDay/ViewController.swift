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
        
    func getWeatherImage(matching weather: String) -> UIImage? {
        switch weather {
        case "맑음" :
            return UIImage(named: "sun")
        case "비" :
            return UIImage(named: "umbrella")
        default :
            return nil
        }
    }
    
    /*
     nil coalescing operator
     nil 병합 연산자
     optional_expr ?? b
     String? ?? String
     
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = ["맑음", "비"].randomElement() ?? "맑음"
        let temperature = 17
        // let temperature = Int.radome(in : -20 ... 38)
        weatherImageView.image = getWeatherImage(matching: weather)
        statusLabel.text = weather
        temperatureLabel.text = "\(temperature)"
    }


}

