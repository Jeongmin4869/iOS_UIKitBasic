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

