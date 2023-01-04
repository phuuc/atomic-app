//
//  HabitStoreModel.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

struct HabitStoreModel {
	private(set) var habitStore = [HabitModel]()

	init() {
		createHabit()
	}

	private mutating func createHabit() {
		let rdNames = ["Run", "Drink", "Gym", "Read"]
		for _ in 0 ..< 10 {
			let rdName = rdNames.randomElement()!
			habitStore.append(HabitModel(name: rdName))
		}
	}

	func find(at index: Int) -> HabitModel {
		return habitStore[index]
	}
}
