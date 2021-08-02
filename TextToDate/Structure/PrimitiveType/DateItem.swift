//
//  DateItem.swift
//  DateDetector
//
//  Created by Alexander on 2/18/21.
//

import Foundation

struct DateItem {
    var day: PureDay
    var time: TimeOfDay
    var offset: DateOffset?
}

enum DateOffset: Comparable {
    case month(month: Int)
    case week(week: Int)
    case day(day: Int)
    case hour(hour: Int, minutes: Int)
    case minuts(minutes: Int)
}

struct PureDay: Equatable {
    var day: Int
    var month: Int
    var year: Int

    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    init(date: Date) {
        let components = Calendar.current.dateComponents([.day, .month, .year], from: date)
        self.day = components.day ?? 1
        self.month = components.month ?? 1
        self.year = components.year ?? 1
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year
    }
}
