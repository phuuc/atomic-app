//
//  AddEditHabitViewController.swift
//  atomic app
//
//  Created by phuc on 09/01/2023.
//

import UIKit

protocol AddEditHabitViewControllerDelegate: AnyObject {
	func addEditHabitViewcontroller(_ controller: AddEditHabitViewController, didfinishAdding habitStore: HabitModel)
}

class AddEditHabitViewController: UIViewController {
	weak var delegate: AddEditHabitViewControllerDelegate?
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
		completeButton.addTarget(self, action: #selector(addHabit), for: .touchUpInside)
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
		nameTextField.delegate = self
		setConstraint()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		nameTextField.becomeFirstResponder()
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
	}

	@objc private func addHabit() {
		var habit = HabitModel()
		habit.name = nameTextField.text
		habit.icon = iconButton.titleLabel?.text
		
		delegate?.addEditHabitViewcontroller(self, didfinishAdding: habit)

		print("called add habit")
	}
}

extension AddEditHabitViewController: UITextFieldDelegate {
//	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//		// return NO to disallow editing.
//		print("TextField should begin editing method called")
//		return true
//	}
//
//	func textFieldDidBeginEditing(_ textField: UITextField) {
//		// became first responder
//		print("TextField did begin editing method called")
//	}
//
//	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//		// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//		print("TextField should snd editing method called")
//		return true
//	}
//
//	func textFieldDidEndEditing(_ textField: UITextField) {
//		// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//
//		print("TextField did end editing method called")
//	}
//
//	func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//		// if implemented, called in place of textFieldDidEndEditing:
//		print("TextField did end editing with reason method called")
//	}

//	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//		// return NO to not change text
//		nameTextField.text = textField.text
//		print("While entering the characters this method gets called")
//		print(nameTextField.text!)
//
//		return true
//	}

	func textFieldShouldClear(_ textField: UITextField) -> Bool {
		// called when clear button pressed. return NO to ignore (no notifications)
		print("TextField should clear method called")
		return true
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// called when 'return' key pressed. return NO to ignore.
		print("TextField should return method called")
		nameTextField.resignFirstResponder()

		return true
	}
}

//// MARK: UITextFieldDelegate <---
