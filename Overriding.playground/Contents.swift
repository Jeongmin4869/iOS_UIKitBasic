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


   // 방법 3. 상속받은 메소드를 overriding. 상위 구현에 기능을 더하는 방법
class Circle3: Figure {
    
    // 읽기 쓰기 전용 속성. 변수
    var radius = 0.0
    
    // 읽기 전용 속성. 상수
    var diameter: Double{
        return radius * 2
    }
    
    // Overriding 시 반드시 override 키워드 추가
    override func draw(){
        super.draw() // Figure의 draw 호출
        print("draw 🍅")
    }
}

let c3 = Circle3(name: "Circle") // 슈퍼클래스의 생성자 호출 가능
c3.draw()

   // 방법4. 속성이나 생성자 같은 메소드도 오버라이딩이 가능하다.

class Oval: Circle3 {
    // override var radius = 0.0
    // 속성은 이처럼 상속받을 수 없다
    // conputed property를 통해 상속받는다
    
    // var radius 는 읽기와 쓰기가 모두 가능한 속성
    // 아래 코드는 읽기 전용 속성으로 오버리이딩
    override var radius : Double {
        get {
            return super.radius
        }
        set {
            super.radius = newValue
        }
    }
    
    // var diameter 는 읽기 전용 속성
    // 아래 코드는 읽기와 쓰기 속성으로 오버라이딩
    override var diameter : Double{
        get {
            return super.diameter
        }
        set {
            // diameter는 상수이기 때문에 다른 값에 접근해야함
            super.radius = newValue / 2
        }
    }
}



/*------------------------------------------*/
/*     상속, 오버리이딩을 금지하는 방법 (final)      */
/*------------------------------------------*/

// final클래스는 다른 클래스가 상속할 수 없다
// 특정 멤버만 오버라이딩 할 수 없게 하고싶다면 메소드 앞에 final

class Figure2{
    var name = "Unknown"
    
    init(name: String = "Unknown"){
        self.name = name
    }
    
    // 오버라이딩이 금지되지만, 호출은 할 수 있다.
    final func draw(){
        print("draw \(name)")
    }
}

final class Circle4: Figure2 {
      
     var radius = 0.0
    
     var diameter: Double{
         return radius * 2
     }

//     override func draw(){
//         super.draw()
//         print("draw 🍅")
//     }
}

let c4 = Circle(name: "Circle")
c4.draw() // 상속은 가능. 오버라이딩만 불가능



/*------------------------------------------*/
/*       ViewController 클래스 패턴 재현         */
/*------------------------------------------*/

class MyViewController {
    init(){
        viewDidLoad()
    }
    
    func viewDidLoad(){
        print("Root View가 메모리에 로드되었습니다.")
    }
    
    func viewWillAppear(){
        print("Root View를 뷰 계층에 추가하기 전입니다.")
    }
    
    func viewIsAppearing(){
        print("Root View를 뷰 계층에 추가하고 있습니다")
    }
    
    func viewDidAppear(){
        print("Root View가 뷰 계층에 추가된 직후입니다.")
    }
    
    // 루트뷰를 뷰 계층에 추가하는 메소드
    func addToViewHierarchy(){
        viewWillAppear()
        print("Root View를 뷰 계층에 추가합니다.")
        viewIsAppearing()
        print("Root View를 뷰 계층에 추가되었습니다.")
        viewDidAppear()
    }
    
}

// 실제로 ViewContoller를 서브클래싱하여 사용
class LoginViewController: MyViewController{
    
    // 화면에 표시하기 위한 초기화
    override func viewDidAppear() {
        // 라이프사이클을 오버라이딩 할 때는 반드시 상위클래스부터 호출
        super.viewDidAppear()
        print("키보드를 표시")
    }
}

let vc = LoginViewController()
// 실제로는 아래 부분이 자동으로 실행됨. 지금은 동작을 알기위해 호출
vc.addToViewHierarchy()

//Root View가 메모리에 로드되었습니다.
//Root View를 뷰 계층에 추가하기 전입니다.
//Root View를 뷰 계층에 추가합니다
//Root View를 뷰 계층에 추가하고 있습니다
//Root View를 뷰 계층에 추가되었습니다
//Root View가 뷰 계층에 추가된 직후입니다.
//키보드를 표시
