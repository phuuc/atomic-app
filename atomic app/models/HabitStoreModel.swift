//
//  HabitStoreModel.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

struct HabitStoreModel {
	var habitStore = [HabitModel]()
	// private(set)
	init() {}

//	init() {
//		createHabit()
//	}

//	private mutating func createHabit() {
//		let rdNames = ["Run Run Run Run Run Run Run Run Run Run Run Run Run Run Run Run ", "Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink Drink", "Gym", "Read"]
//		for _ in 0 ..< 20 {
//			let rdName = rdNames.randomElement()!
//			habitStore.append(HabitModel(name: rdName))
//		}
//	}

	func find(at index: Int) -> HabitModel {
		return habitStore[index]
	}
}
