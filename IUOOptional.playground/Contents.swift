import UIKit

let a : Int? = 0 // 일반 옵셔널
let b : Int! = 0 // IUO 옵셔널

print(a)
print(b)

/*
 출력결과
 
 Optional(0)
 Optional(0)
*/

// let c : Int = a // 컴파일 에러 발생. 옵셔널이므로 값의 유무를 알수 없음
let d : Int = b

/*
 출력결과
 0
*/

/*
 IUO 타입으로 선언을 하면,
 넌옵셔널 타입으로 저장하거나 처리할 때 자동으로 언래핑된다.
 */

let e : Int! = nil // IUO 옵셔널
let f : Int = e // nil이 저장되어 있다면 크러쉬 발생. 가급적 사용하지 않는 것이 좋다.

