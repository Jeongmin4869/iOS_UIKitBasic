//
//  UILabel+Lotto.swift
//  Lotto
//
//  Created by 이정민 on 2025/05/26.
//

import Foundation
import UIKit

extension UILabel {
    func setLottoNumber(_ number: Int, with backgroundColor: UIColor? = nil, textColor: UIColor? = nil) {
        // self.layer.cornerRadius = bounds.width / 2
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
        
        text = "\(number)"
        
        // Nil Coalescing Operator
        self.backgroundColor = backgroundColor ?? getColors(from: number).backgroundColor
        self.textColor = textColor ?? getColors(from: number).textColor
    }
    
    // fileprivate : 해당 파일 안에서만 사용함을 명시
    // 밖에서 label.getColor 호출할 수 없음
    // access modifier. 접근지정자.
    fileprivate func getColors(from number: Int) -> (backgroundColor: UIColor, textColor: UIColor){
        switch number {
            case 1 ... 10:
                return (UIColor.yellow, UIColor.black)
            case 11 ... 20:
                return (UIColor.blue, UIColor.white)
            case 21 ... 30:
                return (UIColor.red, UIColor.white)
            case 31 ... 40:
                return (UIColor.gray, UIColor.white)
            case 41 ... 50:
                return (UIColor.green, UIColor.black)
            default :
                return (UIColor.purple, UIColor.white)
        }
    }
}
