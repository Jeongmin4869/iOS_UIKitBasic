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
    
    @IBOutlet weak var descriptionLabel: UILabel!
        
    /*
    func getWeatherImage(matching weather: String) -> UIImage? {º
         switch weather {
             case "맑음" :
                 return UIImage(named: "sun")
             case "비" :
                 return UIImage(named: "umbrella")
             default :
                 return nil
         }
    }
    */    
    
    /*
     nil coalescing operator
     nil 병합 연산자
     optional_expr ?? b
     String? ?? String
     
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = [Weather.clear, .cloudy, .rain, .snow].randomElement() ?? .clear // 타입추론
        let temperature = Int.random(in: -10 ... 30)
        // let temperature = Int.radome(in : -20 ... 38)0
        weatherImageView.image = weather.image
        statusLabel.text = weather.rawValue
        temperatureLabel.text = "\(temperature)"
        descriptionLabel.text = weather.getDescripton(matching: temperature)
    }


}

