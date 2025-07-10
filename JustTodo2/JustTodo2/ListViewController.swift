//
//  ViewController.swift
//  JustTodo2
//
//  Created by 이정민 on 2025/07/05.
//

import UIKit

class ListViewController: UIViewController {

    var toDoList = [String]()
    
    @IBOutlet weak var toDoTableView: UITableView!
//    /* Delegate패턴 주석처리 */
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination.children.first as? AddViewController{
//            // ListViewController가 AddViewController의 Delegate
//            vc.delegate = self
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*방법 3. Notification Observer*/
        // Notification : 송신국
        // Observer : 주파수를 맞추는 작업
        NotificationCenter.default.addObserver(forName: NSNotification.Name("toDoDidInsert"), object: nil, queue: .main) { noti in
            // noti : Notification 타입의 파라미터
            // 이 클로저는 3번째 파라미터인 queue 에서 실행
            // queue.main : main 스레드
            if let todo = noti.userInfo?["todo"] as? String{
                self.toDoList.append(todo);
                self.toDoTableView.reloadData()
            }
        }
        // Notification 에서 toDoDidINsert로 메세지를 보내면
        // Observer에 등록된 클로저가 동작
        // (Notification) -> Void : Notification 을 받고 리턴값은 없앰
        // {_ in }
    }
}

/* Delegate패턴 주석처리 */
//extension ListViewController: TodoDelegate{
//    func addViewController(_ vc: UIViewController, didInsert todo: String) {
//        toDoList.append(todo)
//        toDoTableView.reloadData()
//    }
//
//    /*
//     // 선택적 메소드로 구현되어 반드시 구현하지 않아도 됨
//     // @objc optional
//    func addViewControllerDidCancel(_ vc: UIViewController) {
//    }
//     */
//
//
//}

extension ListViewController : UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
}
