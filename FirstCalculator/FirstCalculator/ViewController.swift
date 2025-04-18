//
//  ViewController.swift
//  FirstCalculator
//
//  Created by 이정민 on 2025/04/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstOperandField: UITextField!
    @IBOutlet weak var secondOperandField: UITextField!
    
    @IBAction func selectOperator(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let plusAction = UIAlertAction(title: "+(더하기)", style: .default) {_ in
            self.operatorButton.setTitle("+", for: .normal)
        }
        actionSheet.addAction(plusAction)
        
        let minusAction = UIAlertAction(title: "-(빼기)", style: .default){_ in
            self.operatorButton.setTitle("-", for: .normal)
            
        }
        actionSheet.addAction(minusAction)
        
        let multiplyAction = UIAlertAction(title: "*(곱하기)", style: .default) { _ in
            self.operatorButton.setTitle("*", for: .normal)
        }
        actionSheet.addAction(multiplyAction)
        
        let devideAction = UIAlertAction(title: "/(나누기)", style: .default) { _ in
            self.operatorButton.setTitle("/", for: .normal)
        }
        actionSheet.addAction(devideAction)
        
        present(actionSheet, animated: true)
        
    }
    
    
    @IBOutlet weak var operatorButton: UIButton!
    
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func calculate(_ sender: Any) {
        
        let a = Int(firstOperandField.text!)!
        let b = Int(secondOperandField.text!)!
        
        let op = operatorButton.title(for: .normal)!
        var result = 0
        
        if op == "+"{
            result = a + b
        } else if op == "-"{
            result = a - b
        } else if op == "*"{
            result = a * b
        } else if op == "/"{
            result = a / b
        } else {
            print("연산자 선택")
        }
                
        resultLable.text = "\(result)" // String Interpolation
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

