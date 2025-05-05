import UIKit

/*
 
구조체
 : 구조체는 기본적으로 멤버와이즈 이니셜라이서를 제공
 
struct StructName {
    property
    method
    initializer
    subsrcript
}
*/

struct Person {
    var name: String
    var age: Int
    
    func sayHello(){
        print("Hello, World!")
    }
}

func sayHello(){
    print("Hello, World!")
}

// 구조체, 클래스를 사용하여 생성한 객체 -> 인스턴스
let person = Person(name: "Alice", age: 500) // 생성자 문법, 구조체에서 제공하는 이니셜라이저
person.age
sayHello()
person.sayHello()
// 함수는 이름을 통해 호출
// 메소드는 인스턴스의 이름을 통해 호출



/*================================================================================*/

/*
 
클래스

class ClassName {
    property
    method
    initializer
    deinitializer
    subsrcript
}
*/

class Person2{
    var name: String
    var age: Int
    
    func sayHello(){
        print("Hello, World!")
    }
    
    //생성자 정의 필요.
    //모든 저장 속성을 초기화해주어야함
    init(){
        name = "Alice"
        age = 99
    }
    
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
}

// 인스턴스 생성
let person2 = Person2() // Person2의 생성자 호츌 -> 이름이 없으므로 클래스명을 사용
person2.name
person2.sayHello()

let person3 = Person2(name: "Bob", age: 14)
