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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let labels = [number1Label!,number2Label!,number3Label!,number4Label!,number5Label!,number6Label!]
        
        var nums = [Int]()
        while nums.count < labels.count {
            let rnd = Int.random(in: 1 ... 45)
            if !nums.contains(rnd) {
                nums.append(rnd)
            }
        }
        
        // ed, -ing -> 새로운 값을 리턴
        nums.sort()
        
        for(index, label) in labels.enumerated(){
            label.layer.cornerRadius = label.bounds.width / 2
            label.clipsToBounds = true
            
            label.text = "\(nums[index])"
            
            label.backgroundColor = getColors(from: nums[index]).backgroundColor
            label.textColor = getColors(from: nums[index]).textColor
        }
        
        let colors = getColors(from: nil)
        number7Label.backgroundColor = colors.backgroundColor
        number7Label.textColor = colors.textColor
        number7Label.layer.cornerRadius = number7Label.bounds.width/2
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.number1Label.layer.cornerRadius = self.number1Label.bounds.width/2
        }
    }
}

