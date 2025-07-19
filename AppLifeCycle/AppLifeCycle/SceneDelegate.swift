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

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

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
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print(self, #function)
    }

    // sceneDidEnterBackground : Background 상태가 된 이후 호출
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print(self, #function)
    }


}

