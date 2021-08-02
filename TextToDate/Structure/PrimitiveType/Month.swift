//
//  MonthList.swift
//  DateDetector
//
//  Created by Alexander on 2/18/21.
//

import Foundation

enum Month: Int {
    case january = 1
    case febriary = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12

    var title: String {
        switch self {
        case .january:
            return "january"
        case .febriary:
            return "febriary"
        case .march:
            return "march"
        case .april:
            return "april"
        case .may:
            return "may"
        case .june:
            return "june"
        case .july:
            return "july"
        case .august:
            return "august"
        case .september:
            return "september"
        case .october:
            return "october"
        case .november:
            return "november"
        case .december:
            return "december"
        }
    }
}
