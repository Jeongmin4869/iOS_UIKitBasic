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
 
 /*------------------------------------*/
 /*      Application Life Cycle 2      */
 /*------------------------------------*/
 
 /*
  
  App-based life cycle (iOS 13 이전 방식) -> AppDelegate가 모든 life cycle 처리 (scene 사용 X)
  
  Not Running <-> Inactive <-> Active
     ↑ ↓       /       ↑ ↓
   Suspended  <->  Background
  
  
  Not Running : 실행중인 상태가 아님
  
  Inactive : 사용자가 앱을 실행하며 초기화 과정 (바로 위 과정)을 진행한 상태
  
  Active : 초기화 완료 된 후 첫번째 화면이 표시. 앱화면이 표시되어있고 터치 이벤트를 받을 수 있는 상태
           홈화면으로 이동할 경우 -> Inactive -> Background
  
  Background : 작업은 실행중이나, 화면이 표시되지 않아 터치 이벤트는 받을 수 없는 상태
               Background에서 실행할 작업이 없다면 -> Suspended
  
  Suspended : 아무런 작업도 수행하지 않고 최소한의 리소스만 실행하며 일시중지된 상태
              완전히 종료된 것이 아니며, 다시 원래 상태로 돌아갈 수 있다 -> Inactive
  
  Not Running : 앱을 완전히 종료한 상태. 최소한의 리소스도 모두 반납
  
  상태가 변경될 때마다 Delegate 메소드가 호출 
  
  
 
 */
