/* optional chaining */

import UIKit

var greeting = "Hello, playground"
var optionalGreeting: String? = "Hello, playground"

greeting
optionalGreeting

// 체이닝 Chaining
// . 을 통해 연달아 값에 접근할 수 있는 기능
// 일반 체이닝은 전체 표현식 안에 논옵셔널 표현식만 포함되어있다.
// 논옵셔널 -> 값이 매핑되어있지 않고 그대로 저장되어있음
// 체이닝을 통해 값에 접근할 수 있음
greeting.count.description

// 옵셔널 체이닝 Optional Chaining
// 옵셔널은 값을 사용하기 위해 언래핑을 해야함
// optionalGreeting.count // 에러
// optionalGreeting?, optionalGreeting! -> 언래핑
// count 부터는 논옵셔널이기 때문에 ? 또는 ! 를 붙이지 않는다
optionalGreeting = nil
let a = optionalGreeting?.count.description
let b = optionalGreeting!.count.description // 강제추출. 값이 nil일 경우 crush 발생
// a -> 옵셔널 스트링 String?
// b -> 스트링 String
// 체이닝은 가장 오른쪽에있는 표현식의 타입을 따른다.
// ? : 옵셔널 바인딩의 경우 마지막 표현식에 옵셔널이 붙는다
//     -> 값이 nil인경우 이후 멤버에 접근할 수 없으므로 nil을 리턴하고 종료
//     -> 옵셔널 바인딩을 통해 nil인지 아닌지 판단하고 사용
// ! : 강제추출은 마지막 표현식을 따른다.
//     -> 다음 값에 접근하기 전에 강제추출
//     -> 값이 nil이면 crush 발생

// 옵셔널 바인딩
if let optionalGreeting {
    optionalGreeting.count
}
