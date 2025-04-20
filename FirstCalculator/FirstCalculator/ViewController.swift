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
        
        // ? : Optional , ! : Optional로 쌓여진 값을 강제추출, 해당값이 nil 이면 에러
        
        /*
        
         * 옵셔널 바인딩
         
         if let name : Type = OptionalExpression {
            statements
         }
         
         while let name : Type = OptionalExpression {
            statements
         }
         
         guard let name : Type = OptionalExpression else {
            statements
         }
         
        */
        
        /*
         
         let str : String? = "123" // Optional
         print(str!) // unwrapping. 강제추출
         
         let str: String? = nil
         print(str!) // nil을 언래핑 시도할 경우 에러발생
         
         // optional binding
         if let str = str { // it let = str 로 생략 가능
            // 바인딩 성공
            if let num = Int(str) {
                print(num)
            } else {
                // 컨버전 실패 (str이 숫자가 아닐 경우 nil)
            }
         } else {
            // 옵셔널 바인딩 실패
         }
         
         */
        
        /*
        //let a = Int(firstOperandField.text!)!
        if let text = firstOperandField.text, let a = Int(text){
            
        }
        
        // let b = Int(secondOperandField.text!)!
        if let text = secondOperandField.text, let b = Int(text){
            
        }
        
        // let op = operatorButton.title(for: .normal)!
        if let op = operatorButton.title(for: .normal) {
            
        }
         
        */
        
        var result = 0
        
        if let text = firstOperandField.text, let a = Int(text),
           let text = secondOperandField.text, let b = Int(text),
           let op = operatorButton.title(for: .normal) {
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
        }
                            
        resultLable.text = "\(result)" // String Interpolation
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

