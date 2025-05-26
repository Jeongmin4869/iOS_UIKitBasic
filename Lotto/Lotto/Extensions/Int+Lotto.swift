//
//  Int+Lotto.swift
//  Lotto
//
//  Created by 이정민 on 2025/05/26.
//

import Foundation
import UIKit

extension Int {
    /*
    func uniqueRandomNumbers(start:Int, end:Int, count:Int) -> [Int]{
        var nums = [Int]()
        while nums.count < count {
            let rnd = Int.random(in: start ... end)
            if(!nums.contains(rnd)){
                nums.append(rnd)
            }
        }
        nums.sort()
        return nums
    }
     */
    
    
    // static 있으면 타입메소드
    // 없으면 인스턴스 메소드 
    static func uniqueRandomNumbers(in rand: ClosedRange<Int>, count:Int) -> [Int] {
        var nums = [Int]()
        while nums.count < count {
            let rnd = Int.random(in: 1 ... 45)
            if !nums.contains(rnd) {
                nums.append(rnd)
            }
        }
        nums.sort()
        return nums
        
    }
}
