//
//  ViewController.swift
//  ScreenToView
//
//  Created by 이정민 on 2025/07/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*---------------------------------*/
        /*              Screen             */
        /*---------------------------------*/
        
        /*
         
         Screen
         - 앱을 만들때는 거의 사용하지 않는다
         - 이미지를 스크린 크기에 맟주거나 뷰의 스냅샷을 찍을때 사용한다
         - UIScreen로 구현되어있다.
                
         */
        
        /*
         1. viewDidLoad는 뷰가 표시되기 전에 호출된다.
         2. 뷰를 표시하려면 window가 필요하다
         3. window에 뷰를 추가하면 화면에 표시된다.
         4. 뷰가 window에 추가되기 전까지는 화면에 표시되지 않고, window 속성에 접근하면 nil을 리턴한다.
         */
        
        // 스크린의 크기를 얻는 방법
        print(UIScreen.main.bounds) // 만료될 수 있다. 정상적 출력
        print(view.window?.windowScene?.screen.bounds) // nil 리턴
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 스크린의 크기를 얻는 방법
        // 포인트 단위의 숫자가 출력된다.
        print(UIScreen.main.bounds)
        print(view.window?.windowScene?.screen.bounds) // 정상적 출력
        
        if let screen = view.window?.windowScene?.screen {
            let width  = screen.bounds.size.width  * screen.scale
            let height = screen.bounds.size.height * screen.scale
        }
    }


    // Scene안에 Window안에 ViewController
    
    /*---------------------------------*/
    /*              Scene              */
    /*---------------------------------*/
    
    /*
     Scene
     - 앱이 제공하는 Screen에 표시하고 UI를 관리하는 객체
     - UIWindowScene 클래스로 구현되어있다.
     - Scene에서 발생하는 라이프사이클 이벤트는 SceneDelegate가 처리한다.
     */
    
    /*---------------------------------*/
    /*              Window             */
    /*---------------------------------*/
    
    /*
     Window
     - Scene안에는 Window가 있다
     - UI를 표시하는 영역을 제공. 이벤트를 처리하는 역할
     - UIWindow 클래스로 구현되어있다
     - 스토리보드를 사용하지 않는다면 직접 구현해야 한다.
     - 화면에 표시되는 내용을 완전히 새로운 내용으로 교체해야할 때 사용한다.
       ex. window.rootViewController = destination
     */
    
    /*---------------------------------*/
    /*         View Controller         */
    /*---------------------------------*/
    /*
     - Window는 뷰가 표시되는 영역을 제공하고, 실제로 뷰를 배치하고 관리하는건 ViewController
     - 이러한 뷰를 rootViewController라고 한다.
     - window.rootViewController
     - 앱을 구성하는 나머지 컨트롤러는 rootViewController 밑에 차례대로 추가된다.
     
     ViewController는 UIKit으로 앱을 만들 때 가장 중요하고 필수적인 요소
     아래 3가지 요소를 담당한다.
     
     1. 뷰 관리
     
         - 모든 뷰 컨트롤러는 하나의 루트 뷰를 가지고 있다.
         - 뷰 컨트롤러가 관리하는 뷰들은 루트뷰 아래쪽으로 추가된다
         
         ** View (root view )**
         - UIView 로 구현된 객체 / vc.view
         - Root View에는 view 속성으로 접근할 수 있다.
         - 스토리보드에서 추가하는 뷰는 Root View 아래쪽에 추가된다.
     
     2. 이벤트 처리
     
     @IBAction func test(_ sender: Any) {
     }
     
     주로 ViewController 에서 Delegate, Action 등등의 이벤트 처리
     
     
     3. 화면 전환
     
     - 메뉴가 나온다거나 새로운 뷰로 이동 -> View Controller가 기본적으로 제공하는 기능 
     
     */
    
    @IBAction func test(_ sender: Any) {
    }
}

