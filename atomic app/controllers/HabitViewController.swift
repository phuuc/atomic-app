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
	// var habitCollectionDataSource: HabitCollectionViewDataSource!
	lazy var calendar: Calendar = {
		var calendar = Calendar(identifier: .gregorian)
		calendar.firstWeekday = 2
		calendar.timeZone = TimeZone(identifier: "Asia/Bangkok")!
		return calendar
	}()

	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 16.0
		stackView.distribution = .fill
		stackView.alignment = .fill
		stackView.backgroundColor = .clear
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	lazy var calendarStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 16.0
		stackView.distribution = .fillEqually
		stackView.backgroundColor = .clear
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	lazy var tableView: UITableView = {
		let tab = UITableView()
		tab.tableFooterView = UIView()
		tab.backgroundColor = .clear
		tab.delegate = self
		tab.dataSource = habitTableDataSource
		tab.translatesAutoresizingMaskIntoConstraints = false

		return tab
	}()

//	lazy var mon: UILabel = {
//		return Label()
//	}()
//	lazy var tue: UILabel = {
//		return Label()
//	}()
//	lazy var wed: UILabel = {
//		return Label()
//	}()
//	lazy var thu: UILabel = {
//		return Label()
//	}()
//	lazy var fri: UILabel = {
//		return Label()
//	}()
//	lazy var sat: UILabel = {
//		return Label()
//	}()
//	lazy var sun: UILabel = {
//		return Label()
//	}()

	var onDay = Date()

//	lazy var collectionView: UICollectionView = {
//		let layout = UICollectionViewFlowLayout()
//		layout.scrollDirection = .horizontal
//		layout.minimumInteritemSpacing = 0.0
//		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//		collectionView.delegate = self
//		collectionView.dataSource = habitCollectionDataSource
//		collectionView.backgroundColor = .clear
//		collectionView.showsHorizontalScrollIndicator = false
//		collectionView.translatesAutoresizingMaskIntoConstraints = false
//		return collectionView
//	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(stackView)
		// stackView.addArrangedSubview(collectionView)
		stackView.addArrangedSubview(calendarStackView)
		stackView.addArrangedSubview(tableView)
		setupCalendarStackView()
		setUpConstraints()
		tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: habitTableDataSource.tableCellIndentifier)
		// collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: habitCollectionDataSource.collectionCellIndentifier)
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
			calendarStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			calendarStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
			calendarStackView.topAnchor.constraint(equalTo: stackView.topAnchor),
			calendarStackView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1)
		])

//		NSLayoutConstraint.activate([
//			collectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//			collectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
//			collectionView.topAnchor.constraint(equalTo: stackView.topAnchor),
//			collectionView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1)
//		])
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
			tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9)

		])
	}

	private func setupCalendarStackView() {
		let weekdaySymbols = Date.getWeekdaySymbols()
		for i in 0 ... 6 {
			let dayOfWeek = Label()
			dayOfWeek.text = weekdaySymbols[i]
			calendarStackView.addArrangedSubview(dayOfWeek)
		}

//		calendarStackView.addArrangedSubview(mon)
//		calendarStackView.addArrangedSubview(tue)
//		calendarStackView.addArrangedSubview(wed)
//		calendarStackView.addArrangedSubview(thu)
//		calendarStackView.addArrangedSubview(fri)
//		calendarStackView.addArrangedSubview(sat)
//		calendarStackView.addArrangedSubview(sun)
	}

	private func week() -> [String] {
		let monday = onDay.getMonday(using: calendar)
		return calendar.getWeekString(from: monday)
	}

	private func lastWeek() -> [String] {
		onDay = onDay.lastWeek(using: calendar)
		return calendar.getWeekString(from: onDay)
	}

	private func nextWeek() -> [String]! {
		onDay = onDay.nextWeek(using: calendar)
		return calendar.getWeekString(from: onDay)
	}
}

extension HabitViewController: UITableViewDelegate, UICollectionViewDelegate {
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
