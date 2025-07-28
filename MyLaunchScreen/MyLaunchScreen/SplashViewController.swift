//
//  SplashViewController.swift
//  MyLaunchScreen
//
//  Created by 이정민 on 2025/07/28.
//

import UIKit


/*-------------------------------------------*/
/*               LaunchScreen                */
/*-------------------------------------------*/

// 1. LaunchScreen may not set custom classnames !!
// -> outlet action 처리 불가

// 2. LaunchScreen 시간 제어 불가
// -> 조절하기 원한다면 Main 에서 뷰 컨트롤러 생성하여 구현
// -> 준비작업이 완료된 후 화면을 표시하도록 만들 수 있음
// -> sleep을 사용하는 방법은 잘못된 방법 

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.performSegue(withIdentifier: "replaceSegue", sender: nil)
        }
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
