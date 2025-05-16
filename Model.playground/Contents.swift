import UIKit

// * 모델링 예시
// 모델링 추상화 => 필요한 정보를 선택하는 것
// 사람 - 이름, 생일, 성별, 사는곳, ...

class Service {
    // 인스턴스 속성 Instance Property (인스턴스마다 속성값이 다름)
    let title: String // 항상 필요한 값이므로 non optional, Stored Property 상수 저장 속성
    let subtitle: String
    
    // * 이미지 표시
    let cardImageUrlStr: String
    // let cardImageUrl: URL
    // 계산속성. Computed Property
    var cardImageUrl: URL? {
         URL(string: cardImageUrlStr)
        // 읽기 전용 계산 속성 read-only computed property
        // return 생략
    }
    
    let thumbnailImageUrlStr: String?
    var thumbnailImageUrl: URL?{
        guard let str = thumbnailImageUrlStr else {
            return nil
        }
        return URL(string: str)
    }

    // static -> Type Property 타입속성 형식속성
    // 타입속성 : 타입마다 1개만 만들어지는 속성. 초기화 불가능
    // 인스턴스속성 : 인스턴스를 생성할때마다 만들어지는 속성. 초기화 가능
    // 생성자는 인스턴스를 생성할 때마다 호출되므로, 타입속성은 생성자에서 초기화 불가능
    static let reviewScoreformatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0 // 소숫점 부분이 없을때는 정수로 표시되도록
        formatter.maximumFractionDigits = 1
        return formatter
    } ()
    
    
    // 인스턴스 밖에서 인스턴스 멤버에 접근 -> 인스턴스의 이름을 사용
    // 인스턴스 안에서 인스턴스 멤버에 접근 -> self 사용 (생략가능)
    // 타입멤버에 접근 -> 타입의 이름을 사용. Self도 가능
    
    // * 점수 표시
    let reviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = reviewScore else  { return nil  }
        return Self.reviewScoreformatter.string(for: score)
    }
    
    let isCertificationAvaliable: Bool // 수료증
    
    //저장속성만 파라미터로 받는다.
    init(title: String, subtitle: String, cardImageUrlStr: String,
         thumbnailImageUrlStr: String?, reviewScore: Double?,
         isCertificationAvaliable: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.cardImageUrlStr = cardImageUrlStr
        self.thumbnailImageUrlStr = thumbnailImageUrlStr
        self.reviewScore = reviewScore
        self.isCertificationAvaliable = isCertificationAvaliable
    }
}

class Course: Service {
    let courdeId: Int // 구분값
    
    // let isFree: Bool// 무료강좌, 저장속성
    // 계산속성
    var isFree: Bool{
        return price == nil
    }
    
    let lectureCount: Int
    
    // * 시간 표시
    let totalDuration: Int
    
    static let durationFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute] // 열거형처럼 보이지만 타임속성
        formatter.unitsStyle = .full // 열거형
        return formatter
    }()
    
    var totalDurationStr: String? {
        return Self.durationFormatter.string(from: TimeInterval(totalDuration))
    }
    
    let priority: Int // 강좌의 우선순위
    
    let isPublic: Bool
    
    /*===============================================================================*/
    
    // * 금액과 기간 포멧팅
    
    let period: Int? // 수강기간
    
    let price: Double? // 무료 강의가 있을 수 있으므로 옵셔널
    let discountedPrice: Double? // nil이면 할인중이 아님
    
    static let priceFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency // 지역에 맞게 포멧팅
        formatter.locale = Locale(identifier: "ko-KR") // 지역을 설정 (ios locale list)
        return formatter
    }()
    
    var priceString: String?{ // UILabel 의 String 매개변수는 옵셔널값이므로 해당 값도 옵셔널이어도 문제 없음
        guard let price else { return "무료"}
        
        if let discountedPrice {
            return Self.priceFormatter.string(for: discountedPrice)
        }
        
        return Self.priceFormatter.string(for: price)
    }
    
    init(title: String, subtitle: String, cardImageUrlStr: String, thumbnailImageUrlStr: String?, reviewScore: Double?, isCertificationAvaliable: Bool, courseId: Int, lectureCount: Int,
         totalDuration: Int, priority: Int, isPublic: Bool, period: Int?, price: Double?, discountedPrice: Double?) {
        self.courdeId = courseId
        self.lectureCount = lectureCount
        self.totalDuration = totalDuration
        self.priority = priority
        self.isPublic = isPublic
        self.period = period
        self.price = price
        self.discountedPrice = discountedPrice
        super.init(title: title, subtitle: subtitle, cardImageUrlStr: cardImageUrlStr, thumbnailImageUrlStr: thumbnailImageUrlStr, reviewScore: reviewScore, isCertificationAvaliable: isCertificationAvaliable)
    }

}

class Camp: Service {
    
    let campId: Int

    /*===============================================================================*/
    
    let startDate: Date
    var startDateString: String?{
        let formatter = DateFormatter()
        // 사용자가 포메터 셋팅
        // formatter.dateStyle = .full // 열거형
        // formatter.timeStyle = .none // 최종 문자열에서 시간을 뺀다
        formatter.dateFormat = "M월 d일 개강"
        formatter.locale = Locale(identifier: "ko_kr")
        
        return formatter.string(from: startDate)
        
    }
    
    let endDate: Date
    var endDateString: String?{
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 개강"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: endDate)
    }
    
    let isOnlineCamp: Bool

    let locationURL: URL?
    let latitude: Double?
    let longtitude: Double?
    
    // 다른 타입 안에 또다른 다입 -> Nested Type
    // 강의 상태
    // Camp.CampStatus -> 중복제거 Camp.Status
    enum Status : String {
        case preparingForOpening = "개강준비중"
        case recruiting          = "모집중"
        case recruitingEnded     = "모집마감"
        case onGoing             = "개강"
        case ended               = "종강"
    }
    
    let status: Status // 열거형 사용. Camp.CampStatus
    let generation: Int // 가수 표현
    
    // 계산속성
    var statusString: String? {
        return "\(generation)기 \(status.rawValue)"
        
        /*
        switch status {
        case .preparingForOpening:
            return "\(generation)기 개강 중비중"
        case .recruiting:
            return "\(generation)기 모집중"
        case .recruitingEnded:
            return "\(generation)기 모집 마감"
        case .onGoing:
            return "\(generation)기 개강중"
        case .ended:
            return "\(generation)기 종강"
        }
        */
    }
    
    let priority : Int
    let isPublic : Bool
    let period: Int?
    
    let price: Double?
    let discountedPrice: Double?
    var priceString: String?{
        guard let price else { return "무료"}
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency // 지역에 맞게 포멧팅
        formatter.locale = Locale(identifier: "ko-KR") // 지역을 설정 (ios locale list)
        
        if let discountedPrice {
            return formatter.string(for: discountedPrice)
        }
        
        return formatter.string(for: price)
        
    }
    
    init(title: String, subtitle: String, cardImageUrlStr: String, thumbnailImageUrlStr: String?, reviewScore: Double?, isCertificationAvaliable: Bool, campId: Int, startDate: Date, endDate: Date, isOnlineCamp: Bool, locationUrl: URL?, latitude: Double?, longitude: Double?, status: Status, generation: Int, priority: Int, isPublic: Bool, period: Int?, price: Double?, discountedPrice: Double?) {
        self.campId = campId
        self.startDate = startDate
        self.endDate = endDate
        self.isOnlineCamp = isOnlineCamp
        self.locationURL = locationUrl
        self.latitude = latitude
        self.longtitude = longitude
        self.status = status
        self.generation = generation
        self.priority = priority
        self.isPublic = isPublic
        self.period = period
        self.price = price
        self.discountedPrice = discountedPrice
        super.init(title: title, subtitle: subtitle, cardImageUrlStr: cardImageUrlStr, thumbnailImageUrlStr: thumbnailImageUrlStr, reviewScore: reviewScore, isCertificationAvaliable: isCertificationAvaliable)
    }
    
}

/*
 // camp 구조체 안으로 포함시킴
 enum CampStatus {
     case preparingForOpening // 개강준비중
     case recruiting // 모집중
     case recruitingEnded // 모집마감
     case onGoing // 개강
     case ended // 종강
 }
 */


struct updateHistory {
    let id : Int
    let version : String
    let content: String

    let updateDate : Date

}

/*========================================================================================*/

/* 원시값 */

// raw value 원시값

/*
 enum TypeName: RawValueType{
     case caseName = Value
 }
 */

enum Aligment: Int{ // 원시값의 타입이 정수형
    case left // 0
    case right = 100 // 100
    case center // 101
}

// 0부터 시작하며, 이전 케이스부터 1씩 커지는 값을 가지게 된다.
// 원시값은 수정이 불가능하다.
Aligment.left.rawValue   // 0
Aligment.right.rawValue  // 100
Aligment.center.rawValue // 101

Aligment(rawValue: 0)    // .left
Aligment(rawValue: 200)  // nil


enum Weekday: String{
    case sunday
    case monday = "MON"
    case tuesday
    case wednesday
    case thursday = "THU"
    case friday
    case saturday
}

Weekday.wednesday.rawValue // wednesday
Weekday.thursday.rawValue  // THU


/*========================================================================================*/

/*
struct Person {
    let name: String = { "Swift".lowercased()}() // 클로저를 통해 여러줄의 코드로 초기화 가능
}
 */

/*========================================================================================*/

/* 상속 */

// 상속은 클래스만 지원. 구조체는 지원되지 않으므로 값이 중복되어도 어쩔 수 없다

class Person {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// 상속
// 하위클래스(SubClass): 상위클래스 (SuperClass)
// 최상위클래스(RootClass)
// 스위프트는 다중상속을 지원하지 않는다.
class Member: Person {
    let height: Double
    let weight: Double
    
    // 상속받은 속성은 직접 초기화 하지 않고 슈퍼클래스의 생성자를 호출하여 초기화
    // 상속 계층에 속한 서브클래스 생성자는 반드시 큐퍼를래스의 생성자를 호출해야한다.
    init(name: String, age: Int, height: Double, weight:Double) {
        self.height = height
        self.weight = weight
        super.init(name: name, age: age)
    }
}

class Employee: Person{
    let department: String
    let rank: String
    
    init(name: String, age: Int, department: String, rank: String) {
        self.department  = department
        self.rank = rank
        super.init(name: name, age: age)
    }
}

let e = Employee(name: "김김김", age: 20, department:"영업", rank: "주임")
e.department
e.rank
// 상속받은 속성도 바로 접근할 수 있다.
e.name
e.age

let p = Person(name: "박박박", age: 32)
p.name
p.age
