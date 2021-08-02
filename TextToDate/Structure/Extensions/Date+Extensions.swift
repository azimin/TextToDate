//
//  Date+Extensions.swift
//  DateDetector
//
//  Created by Alexander on 2/18/21.
//

import Foundation

extension Date {
    static var is24Hour: Bool {
        guard let dateFormat = DateFormatter.dateFormat(
            fromTemplate: "j",
            options: 0,
            locale: Locale.current
        ) else {
            assertionFailure("Some problem")
            return false
        }
        return dateFormat.firstIndex(of: "a") == nil
    }
}
