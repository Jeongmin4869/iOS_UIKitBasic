//
//  ViewController.swift
//  FirstAnimation
//
//  Created by 이정민 on 2025/05/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var boxView: UIView!
    
    @IBAction func moveBox(_ sender: Any) {
        // swift 5.2
        UIView.animate(withDuration: 10, animations: { // () -> () in
            // 원하는 최종 상태 입력
            self.boxView.frame = CGRect(x: 200, y: 400, width: 200, height: 200)
            self.boxView.backgroundColor = UIColor.yellow
        }) { _ in print("애니메이션 종료") }
        
        // swift 5.3
        UIView.animate(withDuration: 10 ){ // trailing closure가 2개 이상일 경우 ..
            // 원하는 최종 상태 입력
            self.boxView.frame = CGRect(x: 200, y: 400, width: 200, height: 200)
            self.boxView.backgroundColor = UIColor.yellow
        } completion: { _ in
            print("애니메이션 종료")            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

