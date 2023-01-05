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
	var habitCollectionDataSource: HabitCollectionViewDataSource!

	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 16.0
		stackView.distribution = .fill
		stackView.alignment = .fill
		stackView.backgroundColor = .yellow
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	lazy var tableView: UITableView = {
		let tab = UITableView()
		tab.tableFooterView = UIView()
		tab.backgroundColor = .blue
		tab.delegate = self
		tab.dataSource = habitTableDataSource
		tab.translatesAutoresizingMaskIntoConstraints = false
		tab.setContentHuggingPriority(.required, for: .vertical)
		tab.setContentHuggingPriority(.defaultLow, for: .vertical)
		return tab
	}()

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		// layout.itemSize = CGSize(width: 30, height: 40)
		layout.scrollDirection = .horizontal
		layout.minimumInteritemSpacing = 0.0
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.delegate = self
		collectionView.dataSource = habitCollectionDataSource
		collectionView.backgroundColor = .red
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.translatesAutoresizingMaskIntoConstraints = false
//		collectionView.setContentHuggingPriority(.required, for: .vertical)
//		collectionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(stackView)
		stackView.addArrangedSubview(collectionView)
		stackView.addArrangedSubview(tableView)

		setUpConstraints()
		tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: habitTableDataSource.tableCellIndentifier)
		collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: habitCollectionDataSource.collectionCellIndentifier)
	}

	override func loadView() {
		view = habitView
	}

	private func setUpConstraints() {
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
			stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
			stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 8)
		])

		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
			collectionView.topAnchor.constraint(equalTo: stackView.topAnchor),
			collectionView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1)
		])
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
			tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9)

		])
	}
}

extension HabitViewController: UITableViewDelegate, UICollectionViewDelegate {
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
