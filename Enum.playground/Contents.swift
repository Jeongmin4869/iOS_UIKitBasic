import UIKit

/*
 
 enum TypeName {
    case caseName
    case caseName, caseName
 }
 
 */

// 열거형 : 연관된 케이스들을 하나로 묶어 관리하는 타입

enum Alignment {
    case left
    case center
    case right
}

var textAlignment = Alignment.center
textAlignment = .left // 열거형의 이름을 생략하고 케이스 이름만 사용할 수 있다.

// 자동완성 기능을 통해 열거형의 케이스들을 암기할 필요가 없다. 
