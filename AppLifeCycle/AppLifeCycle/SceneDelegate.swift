//
//  SceneDelegate.swift
//  AppLifeCycle
//
//  Created by 이정민 on 2025/07/14.
//

import UIKit

/*
 스토리보드에서 만든 UI는 단위가 ViewController
 이를 Scene에 표시하려면 Window 객체가 필요하다.
 */

/*
 
 앱 실행 로그
 
 <AppLifeCycle.AppDelegate: 0x600003d74240> application(_:willFinishLaunchingWithOptions:)
 <AppLifeCycle.AppDelegate: 0x600003d74240> application(_:didFinishLaunchingWithOptions:)
 <AppLifeCycle.AppDelegate: 0x600003d74240> application(_:configurationForConnecting:options:)
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> scene(_:willConnectTo:options:)
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneWillEnterForeground(_:)
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneDidBecomeActive(_:)
 
 앱실행
 -> Main 호출 -> 이 안에서 UIApplication Main 호출 -> UI Application 인스턴스 AppDelegate 인스턴스 생성
 -> 초기화 실행 (willFinishLaunchingWithOptions,didFinishLaunchingWithOptions)
 -> 화면을 표시하기위해 Scene 생성 (configurationForConnecting / 스토리보드의 이름, 델리게이트 이름 ) -> Scene Delegate도 함께 만들어 둘을 연결
    configurationForConnecting은 매번 호출되는것은 아님. 이미 앱이 실행된적이 있다면 재사용하기 떄문에 이를 호출하지 않음
 -> Window객체 생성 (willConnectTo / 초기화 작업 구현)
 -> UI표시 (sceneWillEnterForeground)
 -> 터치이벤트 처리까지 준비 완료 (sceneDidBecomeActive)
 
 홈이동
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneWillResignActive(_:)
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneDidEnterBackground(_:)

 다시 실행
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneWillEnterForeground(_:)
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneDidBecomeActive(_:)
 
 앱종료
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneWillResignActive(_:)
 <AppLifeCycle.SceneDelegate: 0x600003f6cc40> sceneDidDisconnect(_:)
 <AppLifeCycle.AppDelegate: 0x600003d74240> application(_:didDiscardSceneSessions:)
 <AppLifeCycle.AppDelegate: 0x600003d74240> applicationWillTerminate(_:)
 
 
 sceneDidDisconnect -> 씬과의 연결 끊김
 didDiscardSceneSessions -> 씬이 제거
 applicationWillTerminate -> 앱 종료
 
 */


/*
 
 여러개의 씬 (아이패드실행. 멀티태스킹 스플릿뷰 사용)
 
 스플릿뷰 안됨 -> 다중윈도우 지원되지 않음
 xcode가 자동으로 만들어주는 프로젝트는 씬은 기본적으로 지원하나, 1개의 씬만 지원하는 싱글 윈도우
 info -> Enable Multiple Windows 를 YES
 
 앱실행
 <AppLifeCycle.AppDelegate: 0x6000026081f0> application(_:willFinishLaunchingWithOptions:)
 <AppLifeCycle.AppDelegate: 0x6000026081f0> application(_:didFinishLaunchingWithOptions:)
 <AppLifeCycle.AppDelegate: 0x6000026081f0> application(_:configurationForConnecting:options:)
 <AppLifeCycle.SceneDelegate: 0x600002424d60> scene(_:willConnectTo:options:)
 <AppLifeCycle.SceneDelegate: 0x600002424d60> sceneWillEnterForeground(_:)
 <AppLifeCycle.SceneDelegate: 0x600002424d60> sceneDidBecomeActive(_:)
 -> 0x6000026081f0 : 인스턴스가 저장되어있는 메모리 주소. 같은 인스턴스라면 같은 주소 사용
 
 스플릿 뷰를 사용하여 새로운 씬 추가
 <AppLifeCycle.SceneDelegate: 0x600002424d60> sceneWillResignActive(_:)
 <AppLifeCycle.SceneDelegate: 0x600002424d60> sceneDidBecomeActive(_:)
 <AppLifeCycle.SceneDelegate: 0x600002424d60> sceneWillResignActive(_:)
 <AppLifeCycle.AppDelegate: 0x6000026081f0> application(_:configurationForConnecting:options:)
 <AppLifeCycle.SceneDelegate: 0x6000024782c0> scene(_:willConnectTo:options:)
 <AppLifeCycle.SceneDelegate: 0x6000024782c0> sceneWillEnterForeground(_:)
 <AppLifeCycle.SceneDelegate: 0x600002424d60> sceneDidBecomeActive(_:)
 <AppLifeCycle.SceneDelegate: 0x6000024782c0> sceneDidBecomeActive(_:)
 
 configurationForConnecting가 두번 호출되었으나, 인스턴스 주소가 모두 같다 (0x6000026081f0)
 -> 새로운 씬을 추가한다고 해서 새로운 앱이 실행되는것은 아니다. 앱은 하나만 실행되고 앱델리게이트도 하나만 생성된 상태
 -> 이것을 모든 씬이 공유
 -> configurationForConnecting은 새로운 씬을 리턴
 -> 씬이 연결되기 직전 willConnectTo 호출. 메모리 주소가 이전과 상이 0x600002424d60 <> 0x6000024782c0
 -> 새로운 씬을 만들며 새로운 씬 델리게이트도 함께 만듬
 
 
 앱 종료 (왼 0x60000088ed00 / 오 0x60000089b1e0)
 <AppLifeCycle.SceneDelegate: 0x60000089b1e0> sceneWillResignActive(_:)
 <AppLifeCycle.SceneDelegate: 0x60000088ed00> sceneWillResignActive(_:)
 <AppLifeCycle.SceneDelegate: 0x60000088ed00> sceneDidBecomeActive(_:)
 <AppLifeCycle.SceneDelegate: 0x60000089b1e0> sceneDidEnterBackground(_:)
 2025-07-20 18:34:55.137598+0900 AppLifeCycle[36196:6945202] [Common] Snapshot request 0x6000006c2790 complete with error: <NSError: 0x6000006342a0; domain: BSActionErrorDomain; code: 6 (anulled)>
 <AppLifeCycle.SceneDelegate: 0x60000089b1e0> sceneDidDisconnect(_:)
 <AppLifeCycle.AppDelegate: 0x600000aa01e0> application(_:didDiscardSceneSessions:)
 
 오른쪽 앱 종료 시 왼쪽 앱은 Inactive 상태였다가 다시 Active로 돌아온다
 -> sceneWillResignActive -> sceneDidBecomeActive
 
 */


/*
 
 SceneDelegate는 Scene이 생성되는 시점에 생성되며 Scene마다 하나씩 개별적으로 생성
 
 */

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var sharedData = 0

    // willConnectTo : Scene이 호출되고 나서 앱과 연결되기 직전 호출. 초기화 작업 구현하는곳
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        print(self, #function)
    }

    // sceneDidDisconnect : release 직전 호출. 앱과 연결이 끊어지는 것
    // 이후에 다시 복구할 수 있는 리소스 또는 데이터를 정리하는 소스 구현
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print(self, #function)
    }

    // sceneDidBecomeActive : Active상태가 된 이후 호출
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print(self, #function)
    }
    
    // sceneWillResignActive : Active -> Inactive상태로 전환되기 직전 호출
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print(self, #function)
    }

    // sceneWillEnterForeground : Foreground상태가 되기 직전, UI가 표시되기 직전 호출
    // 네트워크에 다시 연결하는 코드 등을 구현 
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print(self, #function)
    }

    // sceneDidEnterBackground : Background 상태가 된 이후 호출
    // 리소스를 반납하는 코드 구현
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print(self, #function)
    }


}

