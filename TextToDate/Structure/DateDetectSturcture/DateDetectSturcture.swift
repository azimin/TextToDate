//
//  DateDetectSturcture.swift
//  DateDetector
//
//  Created by Alexander on 2/18/21.
//

import Foundation

enum DateDetectSturcturePriority {
    case top
    case medium
    case low
    case custom(value: Int)

    var intValue: Int {
        switch self {
        case .top:
            return 1
        case .medium:
            return 10
        case .low:
            return 20
        case let .custom(value):
            return value
        }
    }
}

enum DateDetectOffset {
    case minutes
    case hours
    case days
    case months
    case years
}

struct DateDetectSturcture {
    var triggerWord: String

    var shouldDetectTimeSeperatly: Bool
    var shouldDetectDateSeperatly: Bool

    var timeDetect: [TimeOfDay]?
    var dateDetect: [DateDetectResult]?

    var priority: DateDetectSturcturePriority
}

enum DateDetectResult {
    case move(offset: DateDetectOffset, value: Int?)
    case findWeekday(weekday: WeekDay)
}
