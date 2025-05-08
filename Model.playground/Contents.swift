import UIKit

// 모델링 추상화 => 필요한 정보를 선택하는 것
// 사람 - 이름, 생일, 성별, 사는곳, ...

struct Course {
    // 인스턴스 속성 Instance Property (인스턴스마다 속성값이 다름)
    let title: String // 항상 필요한 값이므로 non optional, Stored Property 상수 저장 속성
    let subtitle: String
    
    let cardImageUrlStr: String
    // let cardImageUrl: URL
    // 계산속성. Computed Property
    var cardImageUrl: URL? {
         URL(string: cardImageUrlStr)
        // 읽기 전용 계산 속성 read-only computed property
        // return 생략
    }
    
    let thumbnailImageUrlStr: String?
    let thumbnailImageUrl: URL?{
        guard let str = thumbnailImageUrlStr else {
            return nil
        }
        return URL(string: str)
    }
    
    let reviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = reviewScore else  { return nil  }
        
        let formatter : NumberFormatter
        formatter.minimumFractionDigits = 0 // 소숫점 부분이 없을때는 정수로 표시되도록
        formatter.maximumFractionDigits = 1
        return formatter.string(from: score)
    }
    
    let isCertificationAvaliable: Bool // 수료증
    
    let isFree: Bool// 무료강좌
    
    let lectureCount: Int
    
    let totalDuration: Int
    var totalDurationStr: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        return formatter.string(from: Date(timeInterval: totalDuration))
    }
    
    let priority: Int // 강좌의 우선순위
}

