import UIKit

/*
 
 함수와 클로저는 모두 클로저로 분류된다.
 Function : Named Closure
 Closure : Unnamed Closure
 
 */

/*
 함수
func name (params) -> Type {
    
}
*/

/*
 클로저
// params, return Type, in 생략 가능
// 가장 단순한 형태의 클로저 -> { Code }
{ (params) -> Type in
    
}
*/

// 함수
func sayHello() {
    print("Hello")
}

sayHello()

// 클로저
// Closure Expression
// 글로벌 스코프에서는 사용할 수 없음
// 상수에 코드블록을 저장할 수 있다. -> 함수에도 타입이 있다.
let c = { print("Hello") }
c()


/* ========================================================================================== */
 
// 함수에도 타입이 있다.

let a = 0 // Int
let b = "" // String
let f1 : () = sayHello() // 함수의 결과를 저장
let f2 = sayHello // 함수 자체를 저장
let f3 : () -> ()  = sayHello
let f4 : () -> Void = sayHello

func add(a: Int, b: Int) -> Int {
    return a + b
}

let addFunction : (Int, Int) -> Int = add

var f : () -> () = sayHello
let c2 : () -> Void = {print("Hello")}
f = {print("Hello")}
f()


/* ========================================================================================== */


// 파라미터가 클로저
func execute(codeBlock: () -> ()) {
    codeBlock()
}

execute(codeBlock: {print("Hello!")})
execute(codeBlock: sayHello)

let arithmeticFunction = { (a: Int, b: Int) -> Int? in
    return a + b
}

arithmeticFunction(1, 2) // closure는 아규먼트 레이블이 없다. 아규먼트만 전달.

let optionalFunction : ((Int, Int) -> Int)? = nil // Function 타입 자체가 옵셔널


/* ========================================================================================== */

func sayHello2(with name: String = "방문자님") -> String {
    return "\(name) 안녕하세요"
}

sayHello2(with: "ABC")
sayHello2() // 파라미터 기본값
