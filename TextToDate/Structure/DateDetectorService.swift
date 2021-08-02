//
//  DateDetectorService.swift
//  DateDetector
//
//  Created by Alexander on 2/18/21.
//

import Foundation

protocol DateDetectorServiceProtocol {
    func dateItems(fromString string: String, currentDate: Date) -> [DateItem]
}

class DateDetectorService: DateDetectorServiceProtocol {
    func dateItems(fromString string: String, currentDate: Date) -> [DateItem] {
        let components = self.stringComponents(fromString: string)

        // FIXE: in 4.5h

        // 22.30 in 2 days
        // 10.30 in 1 day
        print(components)
        return []
    }

    func stringComponents(fromString string: String) -> [String] {
        var result = ""
        var preveousSymbol: String.Element?

        for char in string {
            if let preveousSymbol = preveousSymbol, char.betweenTimeSymbol == false {
                if char.isNumber && !preveousSymbol.isNumber || !char.isNumber && preveousSymbol.isNumber {
                    result += " "
                }
            }
            result += String(char)
            preveousSymbol = char
        }

        var components = result.components(separatedBy: " ")
        components = components.filter({ $0.isEmpty == false })
        return components
    }
}

extension String.Element {
    var betweenTimeSymbol: Bool {
        return self == ":" || self == "." || self == ","
    }
}
