import UIKit

/*------------------------------------*/
/*       Application Life Cycle       */
/*------------------------------------*/

/*
 
 실행순서
 
 1. main()  -> 가장 먼저 실행되는 함수. 진입점 함수 Entry Point Function
            -> UIApplicationMain()을 호출한다.
            -> @main : 컴파일러가 자동으로 main함수를 만들어준다
 
 2. UIApplicationMain() -> 2가지 객체를 만든다.
                        Application객체(3번째 파라미터) ApplicationDelegate객체(4번째 파라미터)
  
 3. Load Main UI -> Main StoryBorad 로드. 코드로 구현할 시 이 단계 무시
 
 4. Start Initialization -> 초기화 시작.
                         -> ApplicationDelegate에서 메소드 호출
 
 5. Restore UI State -> UI 복원
 
 6. End Initialization -> 마지막 Delegate 호출 / didFinishLaunchingWithOptions
                       -> 공동으로 사용되는 값을 초기화 할 때 사용
                       -> 무언가를 초기화 하는 작업 할 때 사용
 ->
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     // Override point for customization after application launch.
     return true
 }
 
 ---> 비로소 첫번째 화면 실행
 
 
 @main
 -> Delegate 클래스
 
 
 */
