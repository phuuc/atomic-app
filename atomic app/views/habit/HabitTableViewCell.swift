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

		contentView.addSubview(nameLabel)
		
		NSLayoutConstraint.activate([
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

		])
	}

	@available(*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
