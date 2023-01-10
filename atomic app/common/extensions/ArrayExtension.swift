//
//  ArrayExtension.swift
//  atomic app
//
//  Created by phuc on 08/01/2023.
//

import UIKit

extension Array {
	mutating func shiftLeft() {
		let obj = self.first!
		self.removeFirst()
		self.append(obj)
	}
}
