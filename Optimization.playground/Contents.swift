import UIKit

/* 문법 최적화 */

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var result = arr.filter({(num: Int) -> Bool in
    return num.isMultiple(of: 2)
})
print(result)

result = arr.filter({(num)  in
    return num.isMultiple(of: 2)
})
print(result)

result = arr.filter({
    return $0.isMultiple(of: 2) // short-hand argument name
})
print(result)

result = arr.filter({ $0.isMultiple(of: 2) }) // 클로저 바디에 리턴문1개밖에 없을때 생략 가능
                                              // implicit return
print(result) // inline closure

result = arr.filter{ $0.isMultiple(of: 2) } // trailing closure
print(result)


/* ============================================================== */

let cast = ["Vivian", "Marlon", "Kim", "Karl"]

var result2 = cast.filter({(name:String) -> Bool in
    return name.count < 5
})
print(result2)

result2 = cast.filter({(name) in
    return name.count < 5
})
print(result2)

result2 = cast.filter({ return $0.count < 5 })
print(result2)

result2 = cast.filter{ return $0.count < 5 }
print(result2)


/* ============================================================== */

var result3 = cast.contains(where: {(name : String) -> Bool in
    return name.hasPrefix("V")
})

result3 = cast.contains(where: {(name) in
    return name.hasPrefix("V")
})

result3 = cast.contains({$0.hasPrefix("V")})

result3 = cast.contains {$0.hasPrefix("V")}
