//
//  ViewController.swift
//  Lotto
//
//  Created by 이정민 on 2025/04/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var number1Label : UILabel!
    @IBOutlet weak var number2Label : UILabel!
    @IBOutlet weak var number3Label : UILabel!
    @IBOutlet weak var number4Label : UILabel!
    @IBOutlet weak var number5Label : UILabel!
    @IBOutlet weak var number6Label : UILabel!
    @IBOutlet weak var number7Label : UILabel!
    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    /*
    func getColors(from number: Int?) -> (backgroundColor: UIColor, textColor: UIColor){
        guard let number else {
            return (UIColor.purple, UIColor.white)
        }
        
        switch number {
            case 1 ... 10:
                return (UIColor.yellow, UIColor.black)
            case 11 ... 20:
                return (UIColor.blue, UIColor.white)
            case 21 ... 30:
                return (UIColor.red, UIColor.white)
            case 31 ... 40:
                return (UIColor.gray, UIColor.white)
            case 41 ... 50:
                return (UIColor.green, UIColor.black)
            default :
                return (UIColor.purple, UIColor.white)
        }
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let nums = Int.uniqueRandomNumbers(in:  1 ... 45, count: 7)
        
        for (index, label) in labels.enumerated(){
            if label == labels.last {
                label.setLottoNumber(nums[index], with: .purple, textColor: .white)
            }
            else {
                label.setLottoNumber(nums[index])
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // 클로저 안에 있을 경우 외부 값에 접근하기 위해 self 필요 
        coordinator.animate { _ in
            
            for label in self.labels {
                label.layer.cornerRadius = label.bounds.width/2
                label.clipsToBounds = true
            }
            
        }
    }
}

