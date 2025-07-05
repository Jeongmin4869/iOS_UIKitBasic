//
//  AddViewController.swift
//  JustTodo2
//
//  Created by 이정민 on 2025/07/05.
//

import UIKit

class AddViewController: UIViewController {

    // segue를 사용한 데이터 이동
    
    /*---------------------------------*/
    /*  방법2. Delegate                 */
    /*  Delegate 속성을 추가.             */
    /*---------------------------------*/
    
    weak var delegate: ListViewController
    
    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // AddViewController 가 ListViewController 의 tableView에 접근해야한다.
    // ListViewController 가 AddViewController 의 delegate가 되어야 한다.
    // AddViewController : 요청
    // ListViewController : 응답
    @IBAction func save(_ sender: Any) {
        guard let text = inputField.text else {
            return
        }
        dismiss(animated: true)
    }
}
