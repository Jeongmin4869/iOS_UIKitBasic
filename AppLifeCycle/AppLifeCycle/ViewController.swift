//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by 이정민 on 2025/07/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Application 인스턴스에 접근
        // 앱델리게이트에 접근하기위한 수단
//        UIApplication.shared
        // 사용하기 위해 AppDelegate로 타입 캐스팅
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            appDelegate.sharedData
        }
        
        // Scene Delegate 접근 방법 1.
        // UIApplication.shared.connectedScenes // 모든 씬에 접근 가능
        // 멀티윈도우를 지원하지 않는다면 하나밖에 없을테니 바로 first에 접근 가능
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate{
            sceneDelegate.sharedData
        }
        
        // Scene Delegate 접근 방법 2.
        // view 객체를 통해 접근. view가 화면에 표시된 다음에만 접근이 가능
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.sharedData
        }
        
        
        
        // 아래와 같은 속성들은 대부분 공유객체를 리턴한다.
//        URLSession.shared
//        Notification.default
//        UserDefaults.standard
    }


}

