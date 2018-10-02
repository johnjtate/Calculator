//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by John Tate on 10/2/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var displayLabel = UILabel()
    var displayValue: Float {
        get {
            let text = displayLabel.text ?? "0"
            return (text as NSString).floatValue
        }

        set {
            displayLabel.text = "\(newValue)"
            isInMiddleOfTypingANumber = false
        }
    }
    
    // Bool to record whether user is in the middle of typing a number
    var isInMiddleOfTypingANumber = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupDisplayLabel()
        setupNumberButtons()
        setupOperationButtons()
        setupTopRowOfButtons()
        setupSecondRowOfButtons()
        setupThirdRowOfButtons()
        setupBottomRowOfButtons()
        
        
    }
   
    fileprivate func setupDisplayLabel() {
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 50)
        displayLabel.text = "0"
        displayLabel.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        displayLabel.textColor = .white
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayLabel)
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            displayLabel.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    var numberButtonsArray = [UIButton]()
    
    fileprivate func setupNumberButtons() {
        for number in 0...9 {
            let button = UIButton()
            button.layer.borderWidth = 2
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            button.setTitle("\(number)", for: .normal)
            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            numberButtonsArray.append(button)
        }
    }
    
    var operationButtonsArray = [UIButton]()
    
    fileprivate func setupOperationButtons() {
        let addButton = UIButton()
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        operationButtonsArray.append(addButton)
        
        let subtractButton = UIButton()
        subtractButton.layer.borderWidth = 2
        subtractButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        subtractButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        subtractButton.setTitle("-", for: .normal)
        subtractButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        subtractButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtractButton)
        operationButtonsArray.append(subtractButton)
        
        let multiplyButton = UIButton()
        multiplyButton.layer.borderWidth = 2
        multiplyButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        multiplyButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        multiplyButton.setTitle("-", for: .normal)
        multiplyButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        multiplyButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(multiplyButton)
        operationButtonsArray.append(multiplyButton)
        
        let divideButton = UIButton()
        divideButton.layer.borderWidth = 2
        divideButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        divideButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        divideButton.setTitle("÷", for: .normal)
        divideButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        divideButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divideButton)
        operationButtonsArray.append(divideButton)
        
        let enterButton = UIButton()
        enterButton.layer.borderWidth = 2
        enterButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        enterButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        enterButton.setTitle("⏎", for: .normal)
        enterButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        enterButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterButton)
        operationButtonsArray.append(enterButton)
    }
    
    func setupTopRowOfButtons() {
        NSLayoutConstraint.activate([
            numberButtonsArray[7].leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberButtonsArray[7].topAnchor.constraint(equalTo: displayLabel.bottomAnchor),
            numberButtonsArray[8].leadingAnchor.constraint(equalTo: numberButtonsArray[7].trailingAnchor),
            numberButtonsArray[8].topAnchor.constraint(equalTo: numberButtonsArray[7].topAnchor),
            numberButtonsArray[9].leadingAnchor.constraint(equalTo: numberButtonsArray[8].trailingAnchor),
            numberButtonsArray[9].topAnchor.constraint(equalTo: numberButtonsArray[8].topAnchor),
            operationButtonsArray[3].leadingAnchor.constraint(equalTo: numberButtonsArray[9].trailingAnchor),
            operationButtonsArray[3].topAnchor.constraint(equalTo: numberButtonsArray[9].topAnchor)
            ])
    }
    
    func setupSecondRowOfButtons() {
        NSLayoutConstraint.activate([
            numberButtonsArray[4].leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberButtonsArray[4].topAnchor.constraint(equalTo: numberButtonsArray[7].bottomAnchor),
            numberButtonsArray[5].leadingAnchor.constraint(equalTo: numberButtonsArray[4].trailingAnchor),
            numberButtonsArray[5].topAnchor.constraint(equalTo: numberButtonsArray[4].topAnchor),
            numberButtonsArray[6].leadingAnchor.constraint(equalTo: numberButtonsArray[5].trailingAnchor),
            numberButtonsArray[6].topAnchor.constraint(equalTo: numberButtonsArray[4].topAnchor),
            operationButtonsArray[2].leadingAnchor.constraint(equalTo: numberButtonsArray[6].trailingAnchor),
            operationButtonsArray[2].topAnchor.constraint(equalTo: numberButtonsArray[4].topAnchor)
            ])
    }
    
    func setupThirdRowOfButtons() {
        NSLayoutConstraint.activate([
            numberButtonsArray[1].leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberButtonsArray[1].topAnchor.constraint(equalTo: numberButtonsArray[4].bottomAnchor),
            numberButtonsArray[2].leadingAnchor.constraint(equalTo: numberButtonsArray[1].trailingAnchor),
            numberButtonsArray[2].topAnchor.constraint(equalTo: numberButtonsArray[1].topAnchor),
            numberButtonsArray[3].leadingAnchor.constraint(equalTo: numberButtonsArray[2].trailingAnchor),
            numberButtonsArray[3].topAnchor.constraint(equalTo: numberButtonsArray[1].topAnchor),
            operationButtonsArray[1].leadingAnchor.constraint(equalTo: numberButtonsArray[3].trailingAnchor),
            operationButtonsArray[1].topAnchor.constraint(equalTo: numberButtonsArray[1].topAnchor)
            ])
    }
    
    func setupBottomRowOfButtons() {
        NSLayoutConstraint.activate([
            numberButtonsArray[0].leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberButtonsArray[0].topAnchor.constraint(equalTo: numberButtonsArray[1].bottomAnchor),
            operationButtonsArray[4].leadingAnchor.constraint(equalTo: numberButtonsArray[3].leadingAnchor),
            operationButtonsArray[4].topAnchor.constraint(equalTo: numberButtonsArray[0].topAnchor),
            operationButtonsArray[0].leadingAnchor.constraint(equalTo: operationButtonsArray[4].trailingAnchor),
            operationButtonsArray[0].topAnchor.constraint(equalTo: numberButtonsArray[0].topAnchor)
        ])
    }
    
}

