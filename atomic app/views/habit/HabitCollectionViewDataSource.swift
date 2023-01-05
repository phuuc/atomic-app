//
//  HabitCollectionViewController.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	var collectionCellIndentifier = "collectionCell"

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 100
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIndentifier, for: indexPath) as! HabitCollectionViewCell

		cell.dayOfMonth.text = "24"
		return cell
	}
	
}
