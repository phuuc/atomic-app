//
//  HabitTableViewCell.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
	var nameLabel = Label()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		addSubview(nameLabel)

		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
		nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}

	@available(*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
