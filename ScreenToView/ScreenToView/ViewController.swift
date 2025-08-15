//
//  ViewController.swift
//  ScreenToView
//
//  Created by 이정민 on 2025/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    
    /*-----------------------------------------------------*/
    /*              View Controller Life Cycle             */
    /*-----------------------------------------------------*/
    // 라이플 사이클을 구현할 때는 반드시 상위 구현부터 호출해야한다.
    // -> super.viewDidLoad() / super.viewWillAppear(animated) / ...
    
    
    
    // viewDidLoad : 루틉뷰가 메모리에 저장된 다음 호출. 뷰 컨트롤러 라이프사이클 동안 한번만 호출됨
    // 초기화 코드 작성
    // 일반적인 클래스 - 생성자에서 초기화
    // 뷰 컨트롤러 - 루트뷰가 생성된 후 초기화 작업 필요(생성자에서 초기화 불가). 루트뷰는 생성자가 만들어진 다음 생성. viewDidLoad() 에서 초기화
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.viewDidLoad() 로 바뀐다면 화면의 스위치가 표시되지 않음
        // viewDidLoad가 반복되어 호출됨 -> 재귀호출
        
        print(self, #function)
        
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
    
    // viewWillAppear : 루트뷰가 계층에 추가되기 직전에 호출
    // 화면이 표시되기 전 테이블뷰 데이터를 리로드하고싶다면 여기서
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self, #function)
    }
    
    // viewIsAppearing : : 루트뷰가 계층에 추가된 직후에 호출
    // 보통 뷰의 배치를 변경하는 것을 구현
    // xcode 15 이상에서 확인 가능
    // 현재 내가 사용하고있는건 xcode 14
    // override func viewIsAppearing(_ animated: Bool) {
    //    print(self, #function)
    //}
    
    // viewDidAppear : 루트뷰가 계층에 추가되고 화면이 표시된 다음 호출
    // 키보드를 표시하는 기능 구현. 어디에서 해도 똑같이 동작함
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self, #function)
        
        
//         스크린의 크기를 얻는 방법
//         포인트 단위의 숫자가 출력된다.
//        print(UIScreen.main.bounds)
//        print(view.window?.windowScene?.screen.bounds) // 정상적 출력
//
//        if let screen = view.window?.windowScene?.screen {
//            let width  = screen.bounds.size.width  * screen.scale
//            let height = screen.bounds.size.height * screen.scale
//        }
    }

    // viewWillDisappear : 루트뷰가 계층에서 제거되기 직전 호출
    // 계층에 변화가 있다면 호출. 계층에 변환이 없다면 호출되지 않는다.
    // 다른 화면으로 전환될 때 호출된디.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }

    // viewDidDisappear : 루트뷰가 계층에서 제거된 다음 호출
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
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
    
    /*---------------------------------------------*/
    /*         View Controller  - Content VC       */
    /*---------------------------------------------*/
    /*
     
     View Controller는 UIViewController 클래스로 구현되어있다
     화면을 구현할 때는 새로운 클래스를 만들고 UIViewController를 상속한 다음 원하는 기능을 추가하는 방식으로 구현한다.
     
     
     1. Content VC
     - 테이블뷰, 버튼, 이미지 뷰 등을 추가하여 화면을 구성하는 뷰 컨트롤러
     - 대부분은 이에 속한다.
     = 하나의 뷰를 구현하는 뷰 컨트롤러
     
     2. Container VC
     - 하나 이상의 뷰 컨트롤러를 child로 관리
     - child view Controller 사이의 전환을 처리해준다.
     - 탭바컨트롤러, 스플릿뷰컨트롤러
    
     */
    
    /*-----------------------------------------*/
    /*      View Controller  - Life Cycle      */
    /*-----------------------------------------*/
    
    /*
     
     rootView 기준
     
     Initialization -> Load              (viewDidLoad)
     (init)            Appearing         (viewWillAppear / viewIsAppearing)
                       Appeared          (viewDidAppear)
                       Disappearing      (viewWillDisappear)
                       Disappeared       (viewDidDisappear)
                       Deinitialization  (deinit) -- 소멸자, 메모리 제거
     
      
     
     
     */
    
    // * 애플리케이션, 씬은 Delegate를 상속하여 사용하는 Delegate 방식
    
    // * 뷰 컨트롤러에서에서 라이프 사이클 이벤트를 처리하는 방식
    // -> 콜백방식 : 별도의 Delegate를 사용하지 않고. 자기자신의 메소드를 호출하는 방식
    // - 뷰 컨트롤러는 라이프 사이클 이벤트가 발생하면 UIViewController안에 있는 메소드를 호출한다. 
    
    
    
    @IBAction func test(_ sender: Any) {
    }
}

