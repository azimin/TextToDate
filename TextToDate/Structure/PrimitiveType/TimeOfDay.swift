//
//  TimeOfDay.swift
//  DateDetector
//
//  Created by Alexander on 2/18/21.
//

import Foundation

struct TimeOfDay: Equatable, Comparable {
    var hours: Int
    var minutes: Int
    var seconds: Int

    init(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        assert(hours >= 0 && hours < 24, "Hours 0..<24")
        assert(minutes >= 0 && minutes < 60, "Minutes 0..<24")
        assert(seconds >= 0 && seconds < 60, "Seconds 0..<24")

        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }

    func apply(to pureDay: PureDay) -> Date? {
        let string = "\(pureDay.day):\(pureDay.month):\(pureDay.year) \(self.hours):\(self.minutes):\(self.seconds)"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd:MM:yyyy HH:mm:ss"
        return dateFormatter.date(from: string)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hours == rhs.hours && lhs.minutes == rhs.minutes && lhs.seconds == rhs.seconds
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.hours < rhs.hours && lhs.minutes < rhs.minutes && lhs.seconds < rhs.seconds
    }

    static func > (lhs: Self, rhs: Self) -> Bool {
        return lhs.hours > rhs.hours && lhs.minutes > rhs.minutes && lhs.seconds > rhs.seconds
    }

    static func <= (lhs: Self, rhs: Self) -> Bool {
        return lhs.hours <= rhs.hours && lhs.minutes <= rhs.minutes && lhs.seconds <= rhs.seconds
    }

    static func >= (lhs: Self, rhs: Self) -> Bool {
        return lhs.hours >= rhs.hours && lhs.minutes >= rhs.minutes && lhs.seconds >= rhs.seconds
    }
}
