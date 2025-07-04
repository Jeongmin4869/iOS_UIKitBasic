import UIKit


/* -------- Any : 범용타입 -------- */
// 코드를 실행해야지만 어떤값을 저장하는지 알 수 있는 런타임캐스트
var a = 123 // int 타입으로 추론됨
a = 456 // a는 int타입이므로 에러 없음
// a = 23.45 // double타입을 int타입에 저장할 수 없음. 에러

var b: Any = 123
b = 456
b = 456.78 // 에러발생하지 않음
b = "Hello"
// b.count // 에러발생. Any Type 에는 count라는 값이 없다.
           // Any타입은 값을 저장할 뿐, 그 타입이 가지고 있는 메소드는 호출할 수 없다.

/* -------- 타입 캐스팅 -------- */
// is : 타입을 확인하는 연산자. Type check operator
// Value or expr(표현식) is Type
b is Int
b is String

/* -------- 컴파일 타임 캐스트 -------- */
// toll-free bridged type : 서로 호환되는 타입
// Array, NSArray
// Date, NSDate
let str = "Hello"              // Swift String, 구조체
let nsstr: NSString = "Hello"  // NSString, 클래스, Foundation String
// let nsstrFromStr: NSString = str // 에러발생. 서로 호환되지만 바로 적용할 수는 없다.

// as연산자 : type casting operator
// val or expr as Type
// 서로 호환되는 타입이라면 캐스팅이 성공하고 문제없이 실행된다.
let nsstrFromStr: NSString = str as NSString
let strFromNSstr: String = nsstr as String
// let strFromAny: String = b as String // Any와 String은 서로 호환되지 않는다,


/* -------- 런타임캐스트 -------- */

// Forced Cast
let strFromNSstr2: String = b as! String // ! : 강제추출
                                         // 실행해야 오류인지 아닌지를 판단할 수 있음.
                                         // b에 Int값을 저장해도 코딩 단계에서는 오류가 나지 않음
                                         // 타입이 맞지 않으면 crush 발생
// Conditional Casts
let strFromNSstr3: String? = b as? String // : String(옵셔널이 아닐 경우) 컴파일 에러 발생
                                          // 캐스팅에 실패하면 nil을 리턴

// 컨디셔널 캐스팅이 성공했을 때 해당 값을 언래핑하여 b에 바인딩
// -> b를 또다시 옵셔널바이닝 하지 않아도 됨 
// 리턴값의 타입은 String
if let b = b as? String {
    b.count
}
