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
    
    func showAlert( _ message : String, _ title : String = "알림") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func selectOperator(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
//        // 생략되지 않은 풀 코드
//        let action = UIAlertAction(title: "+(더하기)", style: .default, handler: {(action: UIAlertAction) -> Void in
//            self.operatorButton.setTitle("+", for: .normal)
//        })
        
        var action = UIAlertAction(title: "+(더하기)", style: .default, handler: {(action) in
                    self.operatorButton.setTitle("+", for: .normal)
        })
        
        action = UIAlertAction(title: "+(더하기)", style: .default, handler: { _ in
                    self.operatorButton.setTitle("+", for: .normal)
        })
        
        action = UIAlertAction(title: "+(더하기)", style: .default  ) { _ in
            self.operatorButton.setTitle("+", for: .normal)
        }
        
        // 촤적화된 코드
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
        
        var result : Int? = nil
        /*
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
        */
        
        
        // if else -> guard로 코드 정리 (가독성)
        guard let text = firstOperandField.text, let a = Int(text) else {
            showAlert("값을 입력해 주세요")
            return
        }
        
        guard let text = secondOperandField.text, let b = Int(text) else {
            /*
            let alert = UIAlertController(title: "알림", message: "값을 입력해주세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            */
            showAlert("값을 입력해 주세요")
            return
        }
        
        guard let op = operatorButton.title(for: .normal), op != "?" else {
            /*
            let alert = UIAlertController(title: "알림", message: "연산자를 선택해주세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
             */
            showAlert("연산자를 선택해주세요")
            return
        }
        
        switch op {
        case "+" :
            result = a + b
            break;
        case "-" :
            result = a - b
            break;
        case "*" :
            result = a * b
            break;
        case "/" :
            result = a / b
            break;
        default:
            print("연산자 선택")
                /*
                 let alert = UIAlertController(title: "알림", message: "연산자를 선택해주세요", preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "확인", style: .default)
                 alert.addAction(okAction)
                 present(alert, animated: true)
                 */
                showAlert("연산자를 선택해주세요")
        }
        
        guard let result else { // nil로 남아있다면 return. 종료
            return
        }

        resultLable.text = "\(result)" // String Interpolation
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

