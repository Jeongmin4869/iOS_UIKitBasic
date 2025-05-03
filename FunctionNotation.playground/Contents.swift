import UIKit

func sayHello() {
}

func sayHello(with name : String){
}

func sayHello(_ name : String){
}

let a : () -> () = sayHello // Function Notation
let b = sayHello(with:) // argument lable만 사용
let c = sayHello(_:)

/* ==========================================================*/

func add(a: Int, b: Int) -> Int {
    return a + b
}

let d = add(a:b:) // 이 Function Notation만 봐서는 파라미터의 타입과 리턴타입을 알 수 없음. 선언문이 필요
