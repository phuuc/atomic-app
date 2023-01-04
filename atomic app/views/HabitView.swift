//
//  HabitView.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitView: BaseView {
	private var label = Label()

	override init() {
		super.init()

		label.text = "Phuc"
		addSubview(label)
		setupLabel()
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	private func setupLabel() {
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 8),
			label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 8),
			label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16)
		])
	}
}
