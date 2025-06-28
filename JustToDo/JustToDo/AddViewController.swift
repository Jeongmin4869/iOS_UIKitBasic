//
//  AddViewController.swift
//  JustToDo
//
//  Created by 이정민 on 2025/06/27.
//

import UIKit

class AddViewController: UIViewController {
    
    var listVC: ListViewController?

    @IBOutlet weak var inputField: UITextField!
    
    // present : 모달의 화면을 열음
    // dismiss : 모달의 화면을 닫음
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true) // 애니메이션 추가
    }
    
    @IBAction func save(_ sender: Any) {
        
        // 1. 입력한 문자열 가져오기
        guard let text = inputField.text else{
            return
        }
        
        // 2. 텍스트 저장
        listVC?.toDoList.append(text)
        listVC?.toDoTabelView.reloadData()
        
        // 3. 화면 없애기
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
