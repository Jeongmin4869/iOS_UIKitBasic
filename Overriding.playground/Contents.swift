import UIKit

/*------------------------------------------*/
/*             Overriding (재정의)            */
/*------------------------------------------*/

// Overriding (재정의)
// - 클래스 상속 : 슈퍼클래스가 가진 멤버를 서브클래스가 가진다.
// - 상속받은 클래스가 적합하다면 바로 사용해도 되지만, 서브클래스에 맞게 수정해야하는 경우도 있다.
// - 서브클래스에 맞게 바꾸는 작업이 Overriding 이다.

// 방법 1. 슈퍼클래스에서 구현햇던 코드에 새로운 코드를 더한다.

// 방법 2. 슈퍼클래스의 구현을 무시하고 새롭게 구현한다.

class Figure{
    var name = "Unknown"
    
    init(name: String = "Unknown"){
        self.name = name
    }
    
    func draw(){
        print("draw \(name)")
    }
}

 // 방법 1. 상속받은 메소드를 그대로 사용
class Circle: Figure {
    var radius = 0.0
    
}

let c = Circle(name: "Circle") // 슈퍼클래스의 생성자 호출 가능
c.draw()


  // 방법 2. 상속받은 메소드를 overriding. 상위 구현을 완전히 무시하는 방법
  // - 상속받은것보다 override한 메소드가 우선순위가 더 높다
class Circle2: Figure {
    var radius = 0.0
    
    // Overriding 시 반드시 override 키워드 추가
    override func draw(){
        print("draw 🍅")
    }
}

let c2 = Circle2(name: "Circle") // 슈퍼클래스의 생성자 호출 가능
c2.draw()


   // 방법 2. 상속받은 메소드를 overriding. 상위 구현에 기능을 더하는 방법
   // - 상속받은것보다 override한 메소드가 우선순위가 더 높다
class Circle3: Figure {
    var radius = 0.0
    
    // Overriding 시 반드시 override 키워드 추가
    override func draw(){
        super.draw() // Figure의 draw 호출
        print("draw 🍅")
    }
}

let c3 = Circle3(name: "Circle") // 슈퍼클래스의 생성자 호출 가능
c3.draw()
