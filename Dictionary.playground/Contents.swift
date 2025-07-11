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

