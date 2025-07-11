//
//  ViewController.swift
//  Login
//
//  Created by 이정민 on 2025/04/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var pwField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    // 암기하기 좋음
    func showAlert(message: String){
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        //let id = idField.text!
        guard let id = idField.text, !id.isEmpty else {
            showAlert(message: "ID를 입력해 주세요")
            return
        }
        // let password = pwField.text!
        guard let password = pwField.text, !password.isEmpty else {
            showAlert(message: "PW를 입력해 주세요")
            return
        }

        if id == "coding" && password == "1234" {
            resultLabel.text = "로그인성공"
        }else {
            resultLabel.text = "로그인실패"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        idField.becomeFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    
    // 사용자가 키보드를 통해 키를 입력하면 호출(입력 반영 전 호출). true를 리턴하면 실제로 입력반영. false라면 반영 안함
    // true를 리턴할 경우 3번째 파라미터인 string으로 반영이 됨(최종 텍스트)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        var finalId = idField.text ?? ""
        var finalPassword = pwField.text ?? ""
        
        
        if textField == idField {
            guard let range = Range(range, in:finalId) else {
                return true
            }
            // textField.text(바로직전문자),string(변경된문자) 으로는 최종 텍스트를 가져올 수 없음
            // 최종 텍스트를 가져오기 위해 replacingCharacters를 사용
            // replacingCharacters의 range 타입과 매개변수의 range타입이 다름
            // guard문을 사용하여 range 타입 변환
            // range에는 최종 상태의 텍스트 길이(범위)저장
            finalId = finalId.replacingCharacters(in: range, with: string)
        }else if textField == pwField {
            guard let range = Range(range, in:finalPassword) else {
                return true
            }
            finalPassword = finalPassword.replacingCharacters(in: range, with: string)
        }
        
        // print(#function, textField.text, string) // 텍스트가 한글자씩 늦게 호출되는것을 확일 할 수 있음
        
        // 최종 텍스트를 얻는 방법
        // NSRange -> Range 타입으로 변경
        /*
        guard let text = textField.text, let range = Range(range, in:text) else {
            return true
        }
         print(finalText) -> 최종 텍스트를 출력
         */

        
        // 버튼 활성화
        LoginButton.isEnabled = !finalId.isEmpty && !finalPassword.isEmpty
        
        return true // false일 경우 글자 변경이 반영되지 않음
    }
    
    // 매번 편집이 종료되면 메소드 호출
    // 값이 정상이라면 원래대로 돌아옴 (isValid 가 true일때 셋팅한 값이 셋팅)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == idField {
            let cnt = textField.text?.count ?? 0 // 옵셔널일 경우 0을 기본값으로
            let isValidId = (6 ... 12).contains(cnt)
            
            textField.layer.borderWidth = isValidId ? 0 : 1
            textField.layer.borderColor = isValidId ? nil : UIColor.red.cgColor
            textField.layer.cornerRadius = isValidId ?  0 : 5
            textField.tintColor = isValidId ? view.tintColor : UIColor.red
            
            return isValidId
        }
        
        return true
    }
    
    // return 키 선택 시 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function, textField)
        
        switch textField {
            case idField:
                pwField.becomeFirstResponder()
            case pwField:
                login(self) // Action 을 직접 호출할 수 있다.
            default:
                break
        }
        return false
    }

}

