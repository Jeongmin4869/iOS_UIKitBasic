//
//  ViewController.swift
//  SimpleList
//
//  Created by 이정민 on 2025/06/03.
//

import UIKit

// UIViewController : 클래스, UITableViewDataSource : 프로토콜 (요구사항, 규칙)
// swift는 다중상속을 지원하지 않는다.

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

