//
//  ViewController.swift
//  JustToDo
//
//  Created by 이정민 on 2025/06/26.
//

import UIKit

class ListViewController: UIViewController {
    
    var toDoList = [String]()
    
    @IBOutlet weak var toDoTabelView: UITableView!
    
    // prepare : 세그웨이가 실행되기 직전 호출되는 메소드
    // segue : 세그웨이
    // sender : 세그웨이를 호출하는 것. 여기서는 + 버튼
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 새로 표시될 화면에 접근하여 첫번째 화면을 속성(AddViewController 의 listVC) 에 저장
        // segue.source : 첫번째 페이지
        // segue.destination : 목적지 페이지
        
        // 현재는 UIViewController로 업캐스팅 되어있음
        // 원래 속성에 접근하려면 원래 속성으로 다운캐스팅 해줘야 함
        // as : 타입 캐스팅 연산자
        // navigation에 의해 이어져 있으므로 destination.children로 접근
        // destination.children 는 배열 타입. 제일 첫번째 값에 접근 -> first
        if let vc = segue.destination.children.first as? AddViewController {
            vc.listVC = self
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)        
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
}

