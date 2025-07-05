//
//  AddViewController.swift
//  JustToDo
//
//  Created by 이정민 on 2025/06/27.
//

import UIKit

class AddViewController: UIViewController {
    
    // 커플링, 결합도 -> 강하게 의존하고 있어 좋지 않음
    var listVC: ListViewController? // 커플링

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
        // optional Chaining 
        listVC?.toDoList.append(text)
        // toDoTabelView -> 선언만 되어있고 연결되어있지 않다면 오류 발생
        // outlet 이 iuo로 선언되어있는 이유 
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
