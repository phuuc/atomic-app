//
//  Label.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class Label: UILabel {
	@available(*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("NSCoding not supported")
	}

	init() {
		super.init(frame: CGRect.zero)
		self.initializeLabel()
	}

	func initializeLabel() {
		self.textAlignment = .left
		self.font = UIFont(name: "Halvetica", size: 16)
		self.textColor = .black
		self.translatesAutoresizingMaskIntoConstraints = false
		self.numberOfLines = 0
	}
}
