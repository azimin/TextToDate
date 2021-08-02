//
//  String+Extensions.swift
//  DateDetector
//
//  Created by Alexander on 5/14/21.
//

import Foundation

extension String {
    subscript(index: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: index)
        return self[charIndex]
    }

    func oldRangeBehavour(range: NSRange) -> String {
        return (self as NSString).substring(with: range)
    }

    subscript(range: Range<Int>) -> Substring {
        var offset = range.startIndex + range.count
        if offset > self.count {
            offset = self.count
        }
        let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let stopIndex = self.index(self.startIndex, offsetBy: offset)
        return self[startIndex..<stopIndex]
    }

    subscript(range: ClosedRange<Int>) -> String {
        return String(self[range.lowerBound..<(range.upperBound + 1)])
    }

    func firstRangeOf(substring: String) -> ClosedRange<Int>? {
        guard let range = self.range(of: substring) else {
            return nil
        }

        let lower = self.distance(from: self.startIndex, to: range.lowerBound)
        let upper = self.distance(from: self.startIndex, to: range.upperBound)

        return lower...upper
    }
}
