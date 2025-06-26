//
//  ViewController.swift
//  JustToDo
//
//  Created by 이정민 on 2025/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)        
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
}

