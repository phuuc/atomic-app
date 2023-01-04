//
//  ViewController.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitViewController: UIViewController {
	let habitView = HabitView()
	lazy var tableView: UITableView = {
		let tab = UITableView()
		tab.tableFooterView = UIView()
		tab.backgroundColor = UIColor.clear
		tab.delegate = self
		tab.dataSource = self
		tab.translatesAutoresizingMaskIntoConstraints = false
		return tab
	}()

	var habitStoreModel: HabitStoreModel!
	private var cellIndentifier = "cell"
	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(tableView)

		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
			tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
			tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
			tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 8)
		])
		tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: cellIndentifier)
	}

	override func loadView() {
		view = habitView
	}
}

extension HabitViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return habitStoreModel.habitStore.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! HabitTableViewCell

		let habit = habitStoreModel.find(at: indexPath.row)

		cell.nameLabel.text = habit.name

		return cell
	}

	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
