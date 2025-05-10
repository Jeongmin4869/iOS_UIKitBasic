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
    
    // * 점수 표시
    let reviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = reviewScore else  { return nil  }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0 // 소숫점 부분이 없을때는 정수로 표시되도록
        formatter.maximumFractionDigits = 1
        return formatter.string(for: score)
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
    var totalDurationStr: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute] // 열거형처럼 보이지만 타임속성
        formatter.unitsStyle = .full // 열거형
        return formatter.string(from: TimeInterval(totalDuration))
    }
    
    let priority: Int // 강좌의 우선순위
    
    let isPublic: Bool
    
    /*===============================================================================*/
    
    // * 금액과 기간 포멧팅
    
    let period: Int? // 수강기간
    
    let price: Double? // 무료 강의가 있을 수 있으므로 옵셔널
    let discountedPrice: Double? // nil이면 할인중이 아님
    var priceString: String?{ // UILabel 의 String 매개변수는 옵셔널값이므로 해당 값도 옵셔널이어도 문제 없음
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
    
    let status: CampStatus // 열거형 사용
    let generation: Int // 가수 표현
    
    // 계산속성
    var statusString: String {
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

// 강의 상태
enum CampStatus {
    case preparingForOpening // 개강준비중
    case recruiting // 모집중
    case recruitingEnded // 모집마감
    case onGoing // 개강
    case ended // 종강
}
