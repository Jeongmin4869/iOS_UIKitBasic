//
//  TodoDelegate.swift
//  JustTodo2
//
//  Created by 이정민 on 2025/07/07.
//

import UIKit

// AnyObject 을 상속하여 클래스 프로토콜
// weak은 클래스 관련 키워드이기 때문에 일반 프로토콜을 사용할 경우 에러 발생
// 별다른 특성을 추가하지
@objc protocol TodoDelegate : AnyObject{
    // 이름은 아무렇게나 셋팅해도 되지만 Swift가 선호하는 형태로 선언
    // will should will did
    // UIViewController : 호출하는 주체 
    func addViewController(_ vc:UIViewController, didInsert todo: String)
    // 파라미터가 없으므로 메소드명에 그냥 DidCancel 적음
    // 선택적 메소드 : optional -> 반드시 구현하지 않아도 된다
    @objc optional func addViewControllerDidCancel(_ vc:UIViewController)
}

// 1. Swift Protocol
// 모든 메소드가 필수 메소드
// optional을 사용하여 선택적 메소드 구현 불가

// 2. Objective-C 프로토콜
// 프로토콜 앞에 @objc 특성 추가
// 선택적 메소드 구현 가능
