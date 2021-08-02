//
//  DateDetectSturctureExamples.swift
//  DateDetector
//
//  Created by Alexander on 5/14/21.
//

import Foundation

class DateDetectSturctureExamples {
    let tomorrow = DateDetectSturcture(
        triggerWord: "tomorrow[a:3]",
        shouldDetectTimeSeperatly: true,
        shouldDetectDateSeperatly: false,
        timeDetect: nil,
        dateDetect: [.move(offset: .days, value: 1)],
        priority: .top
    )

    let inXDays = DateDetectSturcture(
        triggerWord: "in X days[a:1]",
        shouldDetectTimeSeperatly: true,
        shouldDetectDateSeperatly: false,
        timeDetect: nil,
        dateDetect: [.move(offset: .days, value: nil)],
        priority: .top
    )

    enum ValidateResult {
        case needMore
        case success
        case failed
    }

    typealias StringValidation = (string: String, minValues: Int)

    func validate(structure: DateDetectSturcture, components: [String]) -> ValidateResult {
        let words = structure.triggerWord.components(separatedBy: " ")
        var wordsValues: [StringValidation] = []

        for word in words {
            if word.hasSuffix("]"), let range = word.firstRangeOf(substring: "[a:") {
                let numberString = word[range.upperBound..<word.count - 1]
                let number = Int(numberString) ?? word.count
                wordsValues.append((word, number))
            } else {
                wordsValues.append((word, word.count))
            }
        }

        if components.count > wordsValues.count {
            return .failed
        }

        for (index, component) in components.enumerated() {
            if self.compare(stringValidation: wordsValues[index], string: component) == false {
                return .failed
            }
        }

        if components.count < wordsValues.count {
            return .needMore
        }

        return .success
    }

    func compare(stringValidation: StringValidation, string: String) -> Bool {
        if stringValidation.string == "X" {
            if Double(string) != nil {
                return true
            }
        }

        if stringValidation.string.hasPrefix(string), string.count >= stringValidation.minValues {
            return true
        }
        return false
    }
}
