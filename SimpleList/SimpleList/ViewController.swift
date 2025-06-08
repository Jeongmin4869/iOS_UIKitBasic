//
//  ViewController.swift
//  SimpleList
//
//  Created by 이정민 on 2025/06/03.
//

import UIKit

// UIViewController : 클래스, UITableViewDataSource : 프로토콜 (요구사항, 규칙)
// swift는 다중상속을 지원하지 않는다.

// Delegate pattern : 하나의 객체가 다른 객체의 일을 대신
// dataSource : 데이터 제공 객체
// delegate : 이벤트 처리 객체
// UITableViewDataSource : TableView가 DataSource의 역할을 할 수 있음을 선언

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // #1. 화면에 표시할 셀 생성 -> dequeueReusableCell (재사용 매커니즘) ₩
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // #2. 생성된 cell 에 데이터 셋팅
        cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
        
        // #3. 생성된 cell 리턴
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

