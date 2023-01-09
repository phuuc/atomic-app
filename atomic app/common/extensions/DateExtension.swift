//
//  DateExtension.swift
//  atomic app
//
//  Created by phuc on 08/01/2023.
//

import UIKit

extension Date {
	func getMonday(using calendar: Calendar) -> Date {
		let comps = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
		let mondayInWeek = calendar.date(from: comps)!
		return mondayInWeek
	}
	
	func lastWeek(using calendar: Calendar) -> Date {
		return Calendar.current.date(byAdding: .day, value: -7, to: self)!
	}
	
	func nextWeek(using calendar: Calendar) -> Date {
		return calendar.date(byAdding: .day, value: 7, to: self)!
	}
	
	static func getWeekdaySymbols() -> [String] {
		var symbols = DateFormatter().veryShortWeekdaySymbols!
		
		symbols.shiftLeft()
		
		return symbols
	}
}
