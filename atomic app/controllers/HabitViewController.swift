//
//  ViewController.swift
//  atomic app
//
//  Created by phuc on 04/01/2023.
//

import UIKit

class HabitViewController: UIViewController {
	
	private var habitView: HabitView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = .systemBackground
	}

	override func loadView() {
		self.view = HabitView()
	}

}

