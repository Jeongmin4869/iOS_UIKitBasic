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
    
    // segue를 사용한 데이터 이동
    
    /*---------------------------------*/
    /*  방법1. 커플링                     */
    /*  속성을 사용하여 데이터 연결 (listVC)  */
    /*---------------------------------*/
    // prepare : 세그웨이가 실행되기 직전 호출되는 메소드
    // segue : 세그웨이
    // sender : 세그웨이를 호출하는 것. 여기서는 + 버튼
    // prepare의 sender가 Any타입인이유 -> sender는 여러타입 선언이 가능하므로
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 새로 표시될 화면에 접근하여 첫번째 화면을 속성(AddViewController 의 listVC) 에 저장
        // segue.source : 첫번째 페이지
        // segue.destination : 목적지 페이지
        
        // 현재는 UIViewController로 업캐스팅 되어있음
        // (현재 segue로 연결된 부분은 UINavigationController이고, 이는 UIViewController를 상속중)
        // (destination 는 UIViewController 타입)
        // (UINavigationController 와 destination 는 같은 계층이므로 더 위인 UIViewController로 업캐스팅 됨)
        // 원래 속성에 접근하려면 원래 속성으로 다운캐스팅 해줘야 함
        // as : 타입 캐스팅 연산자
        // navigation에 의해 이어져 있으므로 destination.children로 접근
        // destination.children 는 UIViewController 배열 타입. 제일 첫번째 값에 접근 -> first
        
        // * destinaion이 Any가 아닌 UIViewController타입인 이유
        // destinaion은 무조건 뷰 여야 하며, 뷰가아닐경우 크러쉬
        // Any 타입이라면 뷰가 아닐 수 있으므로 크러쉬 발생 가능성
        // UIViewController를 상속한 모든것은 뷰가 될 수 있음
        
        // NavagaionController는 Container로 분류
        // Container는 다른 뷰 Controller를 관리 -> childern으로 관리중인 뷰 컨트롤러로 접근 가능
        
        // 업캐스팅 되어있을 경우 AddViewController의 속성에 접근할 수 없으므로 다운캐스팅
        // Conditinal Cast (as?) => 캐스팅 실패 시 nil 반환
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

