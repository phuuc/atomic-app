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
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8),
		])
	}

	func setNavigationBar() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonAction))
	}

	private func setupCalendarStackView() {
		let weekdaySymbols = Date.getWeekdaySymbols()
		for i in 0 ... 6 {
			let dayOfWeek = UIButton()
			dayOfWeek.backgroundColor = .systemTeal
			dayOfWeek.setTitle(weekdaySymbols[i], for: .normal)
			dayOfWeek.tintColor = .white
			dayOfWeek.tag = i

			dayOfWeek.addTarget(self, action: #selector(calendarButtonPressed), for: .touchUpInside)

			calendarStackView.addArrangedSubview(dayOfWeek)
		}
	}

	@objc func rightBarButtonAction() {
		navigationController?.pushViewController(addEditHabitViewController, animated: true)
	}

	@objc func calendarButtonPressed(_ sender: UIButton) {
		let date = week()[sender.tag]
		title = date
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
