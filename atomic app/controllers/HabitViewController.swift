//
//  ViewController.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitViewController: UITableViewController {
	// private var habitView: HabitView!
	var habitStoreModel: HabitStoreModel!
	private var cellIndentifier = "cell"

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		tableView = UITableView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: cellIndentifier)
		print("called numberOfRowsInSection")
	}

//	override func loadView() {
//		view = HabitView()
//	}
}

extension HabitViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("called numberOfRowsInSection")
		return habitStoreModel.habitStore.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		print("called cellForRowAt")

		let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! HabitTableViewCell

		let habit = habitStoreModel.find(at: indexPath.row)

		cell.nameLabel.text = habit.name

		return cell
	}
}
