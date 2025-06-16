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

class ViewController: UIViewController{// , UITableViewDataSource {
    
    let fruits:[String] = ["apple", "mango", "banana", "watermelon"]
    let languages = ["swift", "C#", "Java", "C++"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// extension은 타입확장, 프로토콜 구현에 사용할 수 있다.
// 기능적으로 분리된 코드 -> 관리가 쉬워짐
// ViewController의 코드가 길어지면 관리가 힘들어진다.
// TableView를 사용하지 않을경우 아래 코드만 삭제
// extension만 다른 파일로 분리 가능
// Delegate코드는 extension으로 분리하는 것이 좋다.
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("#3", #function)
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("#1", #function, section) // 첫 호출되어 표시할 cell의 갯수를 리턴. 2번 호출됨 (이유는 모름)
        //return 100
        
        switch section{
            case 0:
                return fruits.count
            case 1:
                return languages.count
            default:
                return 0
        }

    }
    
    // cellForRowAt : 셀마다 반복적으로 호출되기 때문에 가벼운 코드만 사용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("#2", #function, indexPath) // 화면에 표시되는 셀보다 조금 많이 호출됨
        
        // #1. 화면에 표시할 셀 생성 -> dequeueReusableCell (재사용 매커니즘. 재사용할 셀이 없다면 생성)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // #2. 생성된 cell 에 데이터 셋팅. 셀이 호출되기 직전에 실행
        if(indexPath.row < 19) {
            // 셀을 항상 생성하는 것이라면 18 이후의 셀은 모두 text가 표시되지 않을것임.
            // 실행해보면 스크롤 했을 경우 18이후의 셀 몇개는 text가 표시되지 않고, 다시 0-0으로 돌아간것을 확인 -> 재사용큐에서 가져온 셀
            // 재사용 된 큐를 계속 사용하고있는것을 확인(재사용큐에 들어간 채로 호출. text를 바꾸지 않으므로 그대로 사용)
            // 재사용큐에 들어갈 때 index순서대로 들어가지 않기 때문에 호출되는 순서는 다를 수 있음
            cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
        }
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row) : \(fruits[indexPath.row%fruits.count])"
        case 1:
            cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row) : \(languages[indexPath.row%languages.count])"
        default:
            break;
        }
        
        
        // #3. 생성된 cell 리턴
        return cell
        
    }
}


// Delegate
// DataSource에서 받은 데이터로 이벤트 실행
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(fruits[indexPath.row])
    }
}
