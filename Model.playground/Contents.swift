import UIKit

// * 모델링 예시
// 모델링 추상화 => 필요한 정보를 선택하는 것
// 사람 - 이름, 생일, 성별, 사는곳, ...

struct Course {
    let courdeId: Int // 구분값
    
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
    
    //let formatter = NumberFormatter()
    let reviewScoreformatter = {
        let formatter NumberFormatter()
        formatter.minimumFractionDigits = 0 // 소숫점 부분이 없을때는 정수로 표시되도록
        formatter.maximumFractionDigits = 1
        return formatter
    } ()
    
    
    // * 점수 표시
    let reviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = reviewScore else  { return nil  }
        return reviewScoreformatter.string(for: score)
    }
    
    let isCertificationAvaliable: Bool // 수료증
    
    // let isFree: Bool// 무료강좌, 저장속성
    // 계산속성
    var isFree: Bool{
        return price == nil
    }
    
    let lectureCount: Int
    
    // * 시간 표시
    let totalDuration: Int
    
    let durationFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute] // 열거형처럼 보이지만 타임속성
        formatter.unitsStyle = .full // 열거형
        return formatter
    }
    
    var totalDurationStr: String? {
        return durationFormatter.string(from: TimeInterval(totalDuration))
    }
    
    let priority: Int // 강좌의 우선순위
    
    let isPublic: Bool
    
    /*===============================================================================*/
    
    // * 금액과 기간 포멧팅
    
    let period: Int? // 수강기간
    
    let price: Double? // 무료 강의가 있을 수 있으므로 옵셔널
    let discountedPrice: Double? // nil이면 할인중이 아님
    
    let priceFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency // 지역에 맞게 포멧팅
        formatter.locale = Locale(identifier: "ko-KR") // 지역을 설정 (ios locale list)
        return formatter
    }()
    
    var priceString: String?{ // UILabel 의 String 매개변수는 옵셔널값이므로 해당 값도 옵셔널이어도 문제 없음
        guard let price else { return "무료"}
        
        if let discountedPrice {
            return priceFormatter.string(for: discountedPrice)
        }
        
        return priceFormatter.string(for: price)
        
    }
    
    init() {
        // 생성자에서 값을 초기화
        formatter.minimumFractionDigits = 0 // 소숫점 부분이 없을때는 정수로 표시되도록
        formatter.maximumFractionDigits = 1
    }
    
}

struct  Camp {
    
    let campId: Int
    let title: String
    let subtitle: String
    
    let cardImageUrlStr: String
    var cardImageUrl: URL?{
        URL(string: cardImageUrlStr)
    }
    
    let thumbnailImageUrlStr: String?
    var thumbnailImageUrl: URL?{
        guard let str = thumbnailImageUrlStr else { return nil}
        return  URL(string: str)
    }
    
    let reviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = reviewScore else  { return nil  }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0 // 소숫점 부분이 없을때는 정수로 표시되도록
        formatter.maximumFractionDigits = 1
        return formatter.string(for: score) //formatter.string 가 리턴하는 타입이 String?
    }
    
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
        return "\(generation)기 \(Status.rawValue)"
        
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

/*========================================================================================*/

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
Alignment.left.rawValue   // 0
Alignment.right.rawValue  // 100
Alignment.center.rawValue // 101

Alignment(rawValue: 0)    // .left
Alignment(rawValue: 200)  // nil


enum Weekday: String{
    case sunday
    case monday = "MON"
    case tuesday
    case wednseday
    case thursday = "THU"
    case friday
    case saturday
}

Weekday.wednesday.rawValue // wednesday
Weekday.thursday.rawValue  // THU


/*========================================================================================*/

static Person {
    let name: String = { "Swift".lowercased()}() // 클로저를 통해 여러줄의 코드로 초기화 가능
}
