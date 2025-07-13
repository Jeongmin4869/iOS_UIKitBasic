//
//  AddViewController.swift
//  JustTodo2
//
//  Created by 이정민 on 2025/07/05.
//

import UIKit

enum Key{
    case todo
}

class AddViewController: UIViewController {

    // segue를 사용한 데이터 이동
    
    /*---------------------------------*/
    /*  방법2. Delegate                 */
    /*  Delegate 속성을 추가.             */
    /*---------------------------------*/
    
    // weak : 클래스와 연관된 키워드
    // 일반 프로토콜을 사용할 경우 에러가 남
    // 클래스 프로토콜을 사용해 주어야 한다.
    /* Delegate패턴 주석처리 */
//    weak var delegate: TodoDelegate?
    
    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any) {
        // delegate?.addViewControllerDidCancel(self)
        // addViewControllerDidCancel는 선택적 메소드
        // addViewControllerDidCancel는 구현될수도 있고 안될수도 있음 -> Optional
        // Optional chaining
//        delegate?.addViewControllerDidCancel?(self)
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
//        delegate?.addViewController(self, didInsert: text)
        
        /* Notification */
        // NotificationCenter : 수신국 역할
        // NotificationCenter를 통해 Notification 을 보낸다.
        let center = NotificationCenter.default
        // // post로 메세지 송신
        // NSNotification.Name : 메세지가 언제 전달되는지 설명할 수 있는 커멘트
        // NSNotification.Name.toDoDidInsert -> .toDoDidInsert : 타입추론 활용
        center.post(name: NSNotification.Name.toDoDidInsert, object: nil, userInfo: [Key.todo: text])
        
        dismiss(animated: true)
    }
}
