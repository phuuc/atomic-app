//
//  BaseView.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class BaseView: UIView {
	// This initializer hides init(frame:) from subclasses
	init() {
		super.init(frame: CGRect.zero)
		self.backgroundColor = .systemBackground
		self.translatesAutoresizingMaskIntoConstraints = false
	}

	// This attribute hides `init(coder:)` from subclasses
	@available(*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("NSCoding not supported")
	}
}
