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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? AddViewController{
            // ListViewController가 AddViewController의 Delegate
            vc.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ListViewController: TodoDelegate{
    func addViewController(_ vc: UIViewController, didInsert todo: String) {
        toDoList.append(todo)
        toDoTableView.reloadData()
    }
    
    /*
     // 선택적 메소드로 구현되어 반드시 구현하지 않아도 됨
     // @objc optional 
    func addViewControllerDidCancel(_ vc: UIViewController) {
    }
     */
    
    
}

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
