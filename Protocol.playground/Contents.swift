import UIKit

/*--------------------프로토콜---------------------*/
/* 선언                                           */
/* protocol ProtocalName {                       */
/*    propertyReqirements                        */
/*    methodRequrements                          */
/*    initializerReqirements                     */
/*    subscriptReqirements                       */
/*  }                                            */
/*-----------------------------------------------*/

// 프로토콜
// 1. 프로토콜은 상속이 가능
// 2. 프로토콜은 클래스, 구조체, 열거형에서 채용이 가능
// 3. 프로토콜은 하나의 독립적인 타입으로 처리 -> 인스턴트를 프로토콜 타입으로 저장할 수 있다.

// .. able, ..ing
// 1. 프로토콜 선언
protocol Walkable{
    // 프로토콜에서는 선언만 호함. 바디를 가져서는 안된다 (구현할 수 없다)
    // 실제 구현은 해당 프로토콜으 사용할 타입에서 구현해야 한다 .
    // func walk() -> Bool
    func walk()
}

// 2. 프로토콜 채용
// 프로토콜에는 타입에서 구현해야 하는 멤버가 선언되어있고 실제 구현은 포함되지 않는다.
// 구조체, 클라스 : 설계서
// 프로토콜 : 요구사항 정의서
// 프로토콜 채택 방식은 상속과 동일하다 (쌍속은 클래스만 가능)
struct Person: Walkable{
    
    let name: String
    
    // 3. 프로토콜 구현
    func walk() {
        print("walk! walk!")
    }
}

let tim = Person(name: "Tim")
tim.name
tim.walk()

// 타입을 Walkable 프로토콜로 저장
// steve는 실제 메모리에는 Person 인스턴스로 저장되어 있지만,
// 컴파일러는 인스턴스를 처리할 때 Walkable 타입으로 처리
// name이 저장되어 있지만 접근은 불가능
let steve: Walkable = Person(name: "Steve")
steve.walk()
// steve.name // 접근 불가



/*-------------------- 프로토콜의 다중채용 ---------------------*/

/*
protocol Runnable{
    func run()
}
*/

// 상속은 하나만 가능하다.
// 프로토콜은 여러개 채용이 가능하다.
struct Person2: Walkable, Runnable{
    let name: String
    func walk() {
        print("walk! walk!")
    }
    
    func run() {
        print("run!! run!!")
    }
}

// 메모리에는 Person2 인스턴스가 저장되어있지만
// 컴파일러는 Runnable 타입으로 처리하기 때문에
// Runnable의 멤버에만 접근할 수 있게 된다.
// 프로토콜은 프로토콜을 상속할 수 있다.
let craig: Runnable = Person2(name: "Craig")
craig.run()
// craig.walk()
// craig.name


/*-------------------- 프로토콜끼리의 상속 ---------------------*/

// 프로토콜은 클래스처럼 다른 프로토콜을 상속할 수 있다.
protocol Runnable: Walkable{
    func run()
}

struct Person3:Runnable{
    let name: String
    func walk() {
        print("walk! walk!")
    }
    
    func run() {
        print("run!! run!!")
    }
}

let min: Runnable = Person3(name: "Min")
min.run()
min.walk() // Runnable 이 Walkable 을 상속하므로 접근 가능
// min.name

// 원래 타입으로 캐스팅 가능
if let min = min as? Person3 {
    min.name
}


/*-------------------- 클래스의 프로토콜 채용 ---------------------*/

class Cat: Runnable{
    
    let name : String
    
    init(name: String) {
        self.name = name
    }
    
    func walk() {
        print("walk! walk!")
    }
    
    func run() {
        print("run!! run!!")
    }
}

let lulu : Walkable = Cat(name: "Lulu")
// list타입은 Walkable 프로토콜 배열이 된다.
// 모든 인스턴트는 같은 프로토콜 채용중
// 스티브가 Walkble 타입으로 저장되어있으며,Walkble이 가장 위쪽에 있으며 가장 제한적이다.
// 업캐스팅은 아니지만, 업캐스팅과 비슷한 기능
// 업캐스팅 : 가장 인접한 공동 클래스로 자동으로 업캐스팅 되는 것
// 프로토콜 : 가장 공통적이며 제한적인 프로토콜로 저장
// 필요하다면 원래 타입으로 캐스팅하여 원래 값에 접근할 수 있다.
let list = [tim, steve, min, lulu]

for elem in list{
    elem.walk()
}

if let lulu = lulu as? Cat{
    lulu.name
}

/*-------------------- 프로토콜에 채용 제한 걸기 ---------------------*/

// 프로토콜은 구조체 클래스 열거형 모두 채용할 수 있다.
// 클래스에만 채용핡수 있게 하려면 아래와 같이 선언하면 된다.
// AnyObject 프로토콜을 상속하면 클래스 프로토콜이 된다.
protocol Walkable2: AnyObject{
    func walk()
}
