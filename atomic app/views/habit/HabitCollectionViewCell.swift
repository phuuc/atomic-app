//
//  HabitCollectionViewCell.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
	var dayOfMonth = Label()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addViews()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func addViews() {
		contentView.addSubview(dayOfMonth)
		NSLayoutConstraint.activate([
			dayOfMonth.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			dayOfMonth.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
			dayOfMonth.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			dayOfMonth.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			
		])
	}
}
