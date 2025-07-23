//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by 이정민 on 2025/07/14.
//

import UIKit

class ViewController: UIViewController {

    // 브라우저로 이동
    @IBAction func openBrowser(_ sender: Any) {
        
        // url로 이동
        // guard let url = URL(string :"https://www.naver.com") else { return }
        
        // 앱 설정으로 이동
        guard let url = URL(string :UIApplication.openSettingsURLString) else { return }
        
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
    /*--------------------------------------*/
    /*         라이플 사이클 이벤트 메소드         */
    /*--------------------------------------*/
    // sceneDidBecomeActive : Active상태가 된 이후 호출
    // sceneDelegate에서 가져온 메소드
    // 과연 호출이 될까 ? -> 호출되지 않음
    // SceneDelegate은 씬을 만들 때 함께 만들어지고, Delegate로 지정된다.
    // 이벤트가 발생하였을 때 Scene 객체는 SceneDelegate에 있는 메소드를 호출
    // ViewController는 UISceneDelegate를 구현하고 있지않음. 프로토콜을 채용하지도, Delegate로 선언하지도 않음
    func sceneDidBecomeActive(_ scene: UIScene) {
        print(self, #function)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Application 인스턴스에 접근
        // 앱 델리게이트에 접근하기위한 수단
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
        
        // AppDelegate 사용 예
        UIApplication.shared.isIdleTimerDisabled = false; // 화면 대기상태로 이동하는 기능을 Off
        
        // 아래와 같은 속성들은 대부분 공유객체를 리턴한다.
//        URLSession.shared
//        Notification.default
//        UserDefaults.standard
        
        
        /*--------------------------------------*/
        /*         라이플 사이클 이벤트 메소드         */
        /*--------------------------------------*/
        // Active상태가 되었을 때 ViewController 에서 호출되는 메소드
        // UIScene.didActivateNotification : iOS 13 부터 새롭게 채용된 메소드
        // SceneDelegate가 아닌 다른 코드에서 라이프사이클 이벤트를 처리하고 싶다면 Notification을 사용
        /*
         <AppLifeCycle.SceneDelegate: 0x600002675ea0> scene(_:willConnectTo:options:)
         <AppLifeCycle.SceneDelegate: 0x600002675ea0> sceneWillEnterForeground(_:)
         <AppLifeCycle.SceneDelegate: 0x600002675ea0> sceneDidBecomeActive(_:)
         NSNotificationName(_rawValue: UISceneDidActivateNotification) -> ViewController에서 추가된 코드 
         
         
         */
        NotificationCenter.default.addObserver(forName: UIScene.didActivateNotification, object: nil, queue: .main ) { _ in
            print(UIScene.didActivateNotification)
        }
        
        
        
    }


}

