import UIKit


var arr:[Int] = [1, 2, 3]
// 배열에는 순서가 있기 때문에 항상 같은 값 리턴
arr.first
arr.last

// 서브스크립트 문법 -> index를 통해 값에 접근
arr[0]
arr[1]
// arr[100] // crush

arr.append(4)
arr.insert(0, at: 0)

arr.remove(at: 0)
arr.removeFirst()
arr.removeLast()
arr.removeAll()

/* --------------------- Dictionary --------------------- */
// [Key : Value]
// 동일한 타입의 값만 저장
// 순서 없이 저장
// 딕셔너리 타입(저장될 타입). 딕셔너리 리터럴 (실제 저장되는 값)
var dict: [String: String] = ["Apple": "사과", "Banana":"바나나"]
// 순서가 없기 때문에 항상 같은값을 리턴함을 보장하지 않음
dict.first
dict["Apple"]
dict["Orange"] // nil 리턴.
dict["Melon", default:"멜론"] // 값이 없다면 nil대신 default 값 리턴


/* --------------------- 값 추가 & 제거 --------------------- */
// 1. 추가 - 메소드 사용
// updateValue(Value, forKey: Key)
// 정렬이 되어있지 않으므로 append, insert 는 없음
// 이미 있는 key라면 기존 값 리턴, 없다면  nil 리턴
// key가 있으면 INSERT 없으면 UPDATE -> Upsert
dict.updateValue("오렌지", forKey: "Orange") // nil
dict.updateValue("우렌지", forKey: "Orange") // 오렌지

// 2. 추가 - 서브스크립트 사용
dict["Strawberry"] = "딸기" //값 추가

// 1. 제거 - 메소드 사용
dict.removeValue(forKey: "Strawberry") // 값 리턴.
dict.removeValue(forKey: "Strawberry") // nil 리턴
dict.removeAll()

// 2. 제거 - 서브스크립트 사용
// nil을 저장하는 것이 아니라 Key라는 요소를 완전히 삭제.
dict["Apple"] = nil


/* --------------------- Optional --------------------- */

// [Int?]
// [Int]?

// 배열자체는 Non Optional
// 요소가 Optional
// 요소에 nil 저장 가능
var arr2:[Int?] = [1, 2, 3, nil]
arr2.first

// 배열 자체가 Optional
// 요소는 Non Optional
var arr3:[Int]? = [1, 2, 3]
arr3?.first
arr3?[0]

// [Key? : Value]
// 문법적으로 허용은 되나 주로 Key는 Non Optional로 사용함
var dict2: [String? : String] = ["Apple": "사과", "Banana":"바나나"]

// [Key : Value?]
// Value가 Optional로 사용함
var dict3: [String : String?] = ["Apple": "사과", "Banana":"바나나"]

// Apple 키에 nil을 저장?
// Apple 키에 해당하는 요소를 제거? -> 이대로 실행된다
// Value가 Optional 이라고 해도 아래의 방식은 무조건 Key에 해당하는 요소를 제거하는 동작
// nil을 저장하고 싶다면 서브스크립트로는 불가능
dict3["Apple"] = nil

// updateValue를 통해 nil 저장
// Apple 키에 nil을 저장
// 하지만 Dictionary의 경우 Key에 값이 없다면 사용하지 않는것이나 다름없음. 거의 쓰이지 않음
dict3.updateValue("Apple", forKey: nil)


// Dictionary 자체가 Optional
var dict4: [String : String]? = ["Apple": "사과", "Banana":"바나나"]
dict4?.first
dict4?["Apple"]
dict4?["Orange"] // nil 리턴.
dict4?["Melon", default:"멜론"] // 값이 없다면 nil대신 default 값 리턴

dict4?.updateValue("오렌지", forKey: "Orange") // nil
dict4?.updateValue("우렌지", forKey: "Orange") // 오렌지

dict4?["Strawberry"] = "딸기" //값 추가

dict4?.removeValue(forKey: "Strawberry") // 값 리턴.
dict4?.removeValue(forKey: "Strawberry") // nil 리턴
// dict4?.removeAll()

// Optional Dictionary 요소의 길이
// dict4? : Optional Dictionary 이기 때문에 붙은 ?
// ["Banana"]? : dict4?["Banana"] 가 옵셔널 스트링이고, 옵셔널 스트링에 접근하기 위해 붙은 ?
dict4?["Banana"]?.count
let r = dict4?["Banana"] // String?
r?.count
