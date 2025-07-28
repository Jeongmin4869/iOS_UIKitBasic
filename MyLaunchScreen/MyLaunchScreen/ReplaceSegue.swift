//
//  ReplaceSegue.swift
//  MyLaunchScreen
//
//  Created by 이정민 on 2025/07/28.
//

import UIKit

// custom segue

class ReplaceSegue: UIStoryboardSegue {
    override func perform() {
        guard let window = source.view.window else {return}
        window.rootViewController = destination
        UIView.transition(with: window, duration: 0.3, options: [.transitionCurlDown], animations: nil)
    }
}
