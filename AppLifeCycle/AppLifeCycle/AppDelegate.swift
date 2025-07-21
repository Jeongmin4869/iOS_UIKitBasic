//
//  AppDelegate.swift
//  AppLifeCycle
//
//  Created by 이정민 on 2025/07/14.
//

import UIKit


/*
 
 Delegate 패턴 : 첫번째 객체는 Delegate를 호출하는 객체
 
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Application 공유객체를 Application.shared 을 사용하여 접근
    // 이곳에서 필요한 데이터를 저장하고 앱 전체에서 공유할 수 있다.
    var sharedData = 0
    
    

    // 추가된 코드. 초기화 코드
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(self, #function)
        return true
    }

    // 무언가를 초기화 할 때 사용하는 델리게이트
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(self, #function)
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(self, #function)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // active -> inactive
        print(self, #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication){
        // Background : UI가 표시되지 않는 상태
        print(self, #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Foreground : UI가 표시된 상태
        print(self, #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // 앱이 완전히 종료되어 Not Running 이 되기 직전
        print(self, #function)
    }
    
    // 앱 실행 시
    // 1. willFinishLaunchingWithOptions -> 2. didFinishLaunchingWithOptions 호출
    // UI가 화면에 표시되었으나 applicationDidBecomeActive 까지는 호출되지 않음.
    // Scene을 사용한다면 applicationDidBecomeActive는 호출되지 않음. sceneDidBecomeActive을 대신 호출 (레퍼런스 확인)
    // Scene을 사용하는것과 관계 없이 DidBecomeActiveNotification를 포스팅
    // 나머지도 Scene을 사용하고 있기 때문에 호출되지 않음
    // 앱 종료 시
    // 3. applicationWillTerminate 호출 
    
    
    
    // MARK: UISceneSession Lifecycle
    
    // configurationForConnecting : 새로운 Scene을 만들때마다 호출
    // 커스터마이징 된 씬을 리턴할 수 있음
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print(self, #function)
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // didDiscardSceneSessions : Scene을 받은다음 호출되는 메소드
    //
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print(self, #function)
    }


}

