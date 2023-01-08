//
//  CalendarExtension.swift
//  atomic app
//
//  Created by phuc on 05/01/2023.
//

import UIKit



extension Calendar {
	
	func getWeekString(from date: Date)-> [String]{
		var weekString = [String]()
		let formatter = DateFormatter()
		formatter.dateFormat = "dd-MM-yyyy"
		for i in 0...6 {
			let day = self.date(byAdding: .day, value: i, to: date)!
			weekString.append(formatter.string(from: day))
		}
		return weekString
	}
}
