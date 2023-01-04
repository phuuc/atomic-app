//
//  ViewController.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitViewController: UIViewController {
	let habitView = HabitView()
	var habitTableDataSource: HabitTableDataSource!
	lazy var tableView: UITableView = {
		let tab = UITableView()
		tab.tableFooterView = UIView()
		tab.backgroundColor = UIColor.clear
		tab.delegate = self
		tab.dataSource = habitTableDataSource
		tab.translatesAutoresizingMaskIntoConstraints = false
		return tab
	}()

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		return collectionView
	}()

	private var collectionCellIndentifier = "collectionCell"
	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(tableView)
		setTableViewConstraint()
		tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: habitTableDataSource.tableCellIndentifier)
	}

	override func loadView() {
		view = habitView
	}

	private func setTableViewConstraint() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
			tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
			tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
			tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 8)
		])
	}
}

extension HabitViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
