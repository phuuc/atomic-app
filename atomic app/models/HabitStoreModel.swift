//
//  HabitStoreModel.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

struct HabitStoreModel {
	private var habitStore = [HabitModel]()

	init() {
		createHabit()
	}

	private mutating func createHabit() {
		let rdNames = ["Run", "Drink", "Gym", "Read"]
		let rdName = rdNames.randomElement()!
		for _ in 0 ..< 10 {
			habitStore.append(HabitModel(name: rdName))
		}
	}
}
