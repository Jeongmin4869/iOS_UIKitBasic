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

