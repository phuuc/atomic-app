//
//  ViewController.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitViewController: UIViewController {
	var onDay = Date()

	var habitTableDataSource: HabitTableDataSource!
	var addEditHabitViewController: AddEditHabitViewController!

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
		tab.showsVerticalScrollIndicator = false
		tab.translatesAutoresizingMaskIntoConstraints = false

		return tab
	}()

	lazy var navBar: UINavigationBar = {
		let screenSize: CGRect = UIScreen.main.bounds
		let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 30))
		navBar.translatesAutoresizingMaskIntoConstraints = false
		return navBar
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		setNavigationBar()
		// view.addSubview(navBar)
		view.addSubview(stackView)
		stackView.addArrangedSubview(calendarStackView)
		stackView.addArrangedSubview(tableView)
		setupCalendarStackView()
		setUpConstraints()
		tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: habitTableDataSource.tableCellIndentifier)
	}

	private func setUpConstraints() {
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
			stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 8),
		])

		NSLayoutConstraint.activate([
			calendarStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			calendarStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
		])

		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
		])
	}

	func setNavigationBar() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(rightBarButtonAction))
	}

	@objc func rightBarButtonAction() {
		navigationController?.pushViewController(addEditHabitViewController, animated: true)
	}

	private func setupCalendarStackView() {
		let weekdaySymbols = Date.getWeekdaySymbols()
		for i in 0 ... 6 {
			let dayOfWeek = Label()
			dayOfWeek.text = weekdaySymbols[i]
			calendarStackView.addArrangedSubview(dayOfWeek)
		}
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
