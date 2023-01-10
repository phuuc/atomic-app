//
//  AddEditHabitViewController.swift
//  atomic app
//
//  Created by phuc on 09/01/2023.
//

import UIKit

class AddEditHabitViewController: UIViewController {
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

	lazy var nameLabel: UILabel = {
		let iconLabel = Label()
		iconLabel.text = "Name"
		iconLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
		return iconLabel
	}()

	lazy var nameTextField: UITextField = {
		let nameTextfield = UITextField()
		nameTextfield.borderStyle = .line
		nameTextfield.translatesAutoresizingMaskIntoConstraints = false
		nameTextfield.placeholder = "habit name"
		nameTextfield.setContentHuggingPriority(.defaultHigh, for: .vertical)
		return nameTextfield
	}()

	lazy var iconLabel: UILabel = {
		let iconLabel = Label()
		iconLabel.text = "Icon"
		iconLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)

		return iconLabel
	}()

	lazy var iconButtonContainer: UIView = {
		let iconButtonContainer = UIView()
		iconButtonContainer.backgroundColor = .systemBackground
		iconButtonContainer.translatesAutoresizingMaskIntoConstraints = false
		iconButtonContainer.setContentHuggingPriority(.defaultHigh, for: .vertical)

		return iconButtonContainer

	}()

	lazy var iconButton: UIButton = {
		let iconButton = UIButton()
		iconButton.setTitle("+", for: .normal)
		iconButton.translatesAutoresizingMaskIntoConstraints = false
		iconButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
		iconButton.backgroundColor = .systemTeal
		return iconButton
	}()
	

	lazy var completeButton: UIButton = {
		let completeButton = UIButton()
		completeButton.setTitle("Complete", for: .normal)
		completeButton.translatesAutoresizingMaskIntoConstraints = false

		completeButton.backgroundColor = .systemTeal
		return completeButton
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .systemBackground
		// Do any additional setup after loading the view.

		view.addSubview(stackView)
		stackView.addArrangedSubview(nameLabel)
		stackView.addArrangedSubview(nameTextField)
		stackView.addArrangedSubview(iconLabel)
		stackView.addArrangedSubview(iconButtonContainer)
		iconButtonContainer.addSubview(iconButton)
		stackView.addArrangedSubview(completeButton)

		setConstraint()
	}

	private func setConstraint() {
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
			stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8),
		])

		NSLayoutConstraint.activate([
			iconButtonContainer.heightAnchor.constraint(equalToConstant: 30),
		])
//		NSLayoutConstraint.activate([
//			completeButton.heightAnchor.constraint(equalToConstant: 30),
//		])
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	     // Get the new view controller using segue.destination.
	     // Pass the selected object to the new view controller.
	 }
	 */
}
