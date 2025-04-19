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
    
    @IBAction func login(_ sender: Any) {
        let id = idField.text!
        let password = pwField.text!

        // Early Exit
        guard !id.isEmpty && !password.isEmpty else {
            print("계정을 입력하세요")
            return // guard의 else 문은 반드시 return 이 필요 -> Early return
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


}

