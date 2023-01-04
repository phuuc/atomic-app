//
//  HabitTableDataSource.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitTableDataSource: NSObject, UITableViewDataSource {
	let tableCellIndentifier = "tableCell"
	var habitStoreModel: HabitStoreModel!

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return habitStoreModel.habitStore.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIndentifier, for: indexPath) as! HabitTableViewCell
		
		let habit = habitStoreModel.find(at: indexPath.row)
		
		cell.nameLabel.text = habit.name
		
		return cell
	}
}
