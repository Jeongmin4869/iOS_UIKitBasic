//
//  Weather.swift
//  SunnyDay
//
//  Created by 이정민 on 2025/05/25.
//

import UIKit

enum Weather: String {
    case clear = "맑음"
    case cloudy = "흐림"
    case rain = "비"
    case snow = "눈"
    
    // 계산식
    var image: UIImage? {
        switch self {
            case .clear :
                return UIImage(named: "sun")
            case .cloudy :
                return UIImage(named: "umbrella")
            case .rain :
                return UIImage(named: "sun")
            case .snow :
                return UIImage(named: "sun")
        }
    }
    
    func getDescripton(matching temperature: Int) -> String? {
        switch temperature {
        case ..<(-10):
            return "외출조심"
        case -10 ... 10:
            return "두꺼운 겉옷"
        case 11 ... 20:
            return "일교차 조심"
        case 21 ... 30:
            return "초여름 날씨"
        case 31... :
            return "더위 조심"
        default:
            return nil
        }
    }
}
