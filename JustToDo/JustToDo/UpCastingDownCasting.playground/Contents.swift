import UIKit

/*--------------- UpCasting / DownCasting ---------------*/
// Upcasting과 downCasting은 상속과 연관되어있음
// 상속은 class만 가능 -> Upcasting과 downCasting는 구조체, 열거형에서는 사용 불가
class A{
    let one = "one"
}

class B: A{
    let two = "two"
}

class C: B{
    let three = "three"
}

let a = A()
a.one
// a.two // 접근 불가
// a.three // 접근 불가

let b = B()
b.one
b.two
// b.three // 접근불가

let c = C()
c.one
c.two
c.three

// 상속 : A(가장 위) d -> B -> C(가장 아래)

/*--------------- UpCasting ---------------*/
// UpCasting : 상속계층에서 아래쪽에 있는 인스턴스를 위쪽의 타입으로 저장
// UpCasting는 컴파일이 된다면 성공한 것이다.
let b2: A = B()
// let b3: UILabel = B() // 상속계층이 아니므로 업캐스팅 불가
b2.one
// b2.two // 에러발생. 접근할 수 있는 멤버가 위쪽의 타입으로 제한된다.

// let b2: C = B() // 에러발생. 상속계층의 아래쪽에 있는 타입으로 저장 불가. three에 접근이 불가능하므로 에러

/*--------------- UpCasting 활용 ---------------*/
// 원래는 배열에 모두 같은 타입의 값만 들어가야함
// Any를 사용하면 여러 타입을 저장할 수 있으나,
// Any 타입으로 저장되어 있는 것이므로 사용하기 위해서는 다시 해당 값으로 캐스팅을 해주어야 한다.
let valueList = [1, 2, "3"] as [Any]
// valueList[2].count // Any이므로 사용 불가
// 원래 타입으로 캐스팅
if let str = valueList[2] as? String {
    str.count
}

// 모든 값의 타입이 다르나, 저장하는 데에는 문제가 없다.
let objList = [a, b, c] // A 클래스 타입으로 업캐스팅 되어 저장이 된다.
objList[0].one // 타입캐스팅 없이 A클래스 멤버에 바로 접근 가능

// UpCasting을 사용하는 이유
// 1. 같은 계층에 속한 여러 타입을 별도의 추가코드 없이 한번에 저장하고 공통적인 멤버는 별도의 타입 캐스팅 없이 바로 사용


/*--------------- DownCasting 활용 ---------------*/
// objList.last?.three // 접근 불가. 현재는 모두 A클라스 타입. 사용하고 싶다면 원래 속성으로 다운 캐스팅 필요
if let c = objList.last as? C {
    c.three
}


// a는 실제로 A클라스의 객체
// A를 갑자기 C로 캐스팅 할 수 없음.
// 다운캐스팅 실패 -> if문이 실행되지 않음
if let a = objList.last as? C {
    a.three
}
