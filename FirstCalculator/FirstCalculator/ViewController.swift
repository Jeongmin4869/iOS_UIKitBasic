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
        
        /*
        var action = UIAlertAction(title: "+(더하기)", style: .default, handler: {(action) in
                    self.operatorButton.setTitle("+", for: .normal)
        })
        
        action = UIAlertAction(title: "+(더하기)", style: .default, handler: { _ in
                    self.operatorButton.setTitle("+", for: .normal)
        })
        
        action = UIAlertAction(title: "+(더하기)", style: .default  ) { _ in
            self.operatorButton.setTitle("+", for: .normal)
        }
        */
        
        // 촤적화된 코드
        let plusAction = UIAlertAction(title: "+(더하기)", style: .default) {_ in
            self.operatorButton.setTitle("+", for: .normal)
            self.selectedOperator = .plus
        }
        actionSheet.addAction(plusAction)
        
        let minusAction = UIAlertAction(title: "-(빼기)", style: .default){_ in
            self.operatorButton.setTitle("-", for: .normal)
            self.selectedOperator = .minus
        }
        actionSheet.addAction(minusAction)
        
        let multiplyAction = UIAlertAction(title: "*(곱하기)", style: .default) { _ in
            self.operatorButton.setTitle("*", for: .normal)
            self.selectedOperator = .mutiply
        }
        actionSheet.addAction(multiplyAction)
        
        let devideAction = UIAlertAction(title: "/(나누기)", style: .default) { _ in
            self.operatorButton.setTitle("/", for: .normal)
            self.selectedOperator = .divide
        }
        actionSheet.addAction(devideAction)
        
        present(actionSheet, animated: true)
        
    }
    
    
    @IBOutlet weak var operatorButton: UIButton!
    
    @IBOutlet weak var resultLable: UILabel!
    
    var selectedOperator : Operator? // 선택하지 않은 경우를 고려하여 옵셔널
    
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
            firstOperandField.becomeFirstResponder() // 포커싱
            showAlert("값을 입력해 주세요")
            return
        }
        
        guard let text = secondOperandField.text, let b = Int(text) else {
            showAlert("값을 입력해 주세요")
            return
        }
        
        guard let op = selectedOperator else {

            showAlert("연산자를 선택해주세요")
            return
        }
        
        switch op {
            case .plus :
                result = a + b
            case .minus :
                result = a - b
            case .mutiply :
                result = a * b
            case .divide :
                result = a / b
        }
        
        guard let result else { // nil로 남아있다면 return. 종료
            return
        }

        resultLable.text = "\(result)" // String Interpolation
        
        // firstOperandField.resignFirstResponder() // 포커싱해제
        if firstOperandField.isFirstResponder{
            firstOperandField.resignFirstResponder()
        }
        
        if secondOperandField.isFirstResponder{
            secondOperandField.resignFirstResponder()
        }
    }
    
    // First Responder : 최초 응답 객체
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate 연동
        firstOperandField.delegate = self // viewController 를 Delegate로 지정 
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstOperandField.becomeFirstResponder() // 포커싱
    }

}

extension ViewController: UITextFieldDelegate {
    
    // 텍스트 필드에 입력되는 내용이 바뀔 때 마다 반복적으로 호출
    // true : 변경된 값 반영
    // false : 변경된 값 버리고 반영하지 않음
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 3번째 파라미터 String (마지막 입력값. 삭제일 경우 빈값)
        // 삭제일 경우 이벤트 없으므로 true 리턴
        guard !string.isEmpty else { return true }
        
        // text를 숫자로 바꿀 수 없는 경우 (문자열이 입력된 경우) -> false리턴
        // false를 리턴하게 하여 변경사항 반영하지 않음
        guard let _ = Int(string) else {return false}
        
        
        return true
    }
}


