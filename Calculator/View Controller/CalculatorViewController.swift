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
    // initialize an instance of the Stack class
    var stack = Stack()
    
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
        setButtonHeights()
        setButtonWidths()
        
        
    }
   
    fileprivate func setupDisplayLabel() {
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 50)
        displayLabel.text = "0"
        displayLabel.backgroundColor = #colorLiteral(red: 0.06852049593, green: 0.1143220634, blue: 0.03557806592, alpha: 1)
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
            button.layer.borderWidth = 4
            button.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
            button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            button.setTitle("\(number)", for: .normal)
            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            numberButtonsArray.append(button)
        }
    }
    
    var operationButtonsArray = [UIButton]()
    
    fileprivate func setupOperationButtons() {
        let addButton = UIButton()
        addButton.layer.borderWidth = 4
        addButton.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        addButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        operationButtonsArray.append(addButton)
        
        let subtractButton = UIButton()
        subtractButton.layer.borderWidth = 4
        subtractButton.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        subtractButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        subtractButton.setTitle("-", for: .normal)
        subtractButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        subtractButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtractButton)
        operationButtonsArray.append(subtractButton)
        
        let multiplyButton = UIButton()
        multiplyButton.layer.borderWidth = 4
        multiplyButton.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        multiplyButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        multiplyButton.setTitle("x", for: .normal)
        multiplyButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        multiplyButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        // add target action
        view.addSubview(multiplyButton)
        operationButtonsArray.append(multiplyButton)
        
        let divideButton = UIButton()
        divideButton.layer.borderWidth = 4
        divideButton.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        divideButton.backgroundColor = #colorLiteral(red: 1, green: 0.3547734186, blue: 0, alpha: 1)
        divideButton.setTitle("÷", for: .normal)
        divideButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        divideButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        // add target action
        view.addSubview(divideButton)
        operationButtonsArray.append(divideButton)
        
        let enterButton = UIButton()
        enterButton.layer.borderWidth = 4
        enterButton.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        enterButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        enterButton.setTitle("⏎", for: .normal)
        enterButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        enterButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        // add target action
        view.addSubview(enterButton)
        operationButtonsArray.append(enterButton)
        
        let clearButton = UIButton()
        clearButton.layer.borderWidth = 4
        clearButton.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        clearButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        clearButton.setTitle("C", for: .normal)
        clearButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        // add target action
        view.addSubview(clearButton)
        operationButtonsArray.append(clearButton)
    }
    
    func setupTopRowOfButtons() {
        NSLayoutConstraint.activate([
            numberButtonsArray[7].leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberButtonsArray[7].topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 100),
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
            operationButtonsArray[5].leadingAnchor.constraint(equalTo: numberButtonsArray[2].leadingAnchor),
            operationButtonsArray[5].topAnchor.constraint(equalTo: numberButtonsArray[0].topAnchor),
            operationButtonsArray[0].leadingAnchor.constraint(equalTo: operationButtonsArray[4].trailingAnchor),
            operationButtonsArray[0].topAnchor.constraint(equalTo: numberButtonsArray[0].topAnchor)
        ])
    }
    
    func setButtonHeights() {
        let allButtons = numberButtonsArray + operationButtonsArray
        for button in allButtons {
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
            ])
        }
    }

    func setButtonWidths() {
        let allButtons = numberButtonsArray + operationButtonsArray
        for button in allButtons {
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
                ])
        }
    }
    
    // MARK: - Calculator Functionality
    
    func addNumberToEntry(button: UIButton) {
        
        guard let number = button.currentTitle else { return }
        
        // already typing in a number
        if isInMiddleOfTypingANumber {
            let displayValue = displayLabel.text ?? ""
            displayLabel.text = displayValue + number
        } else {
        // typing in the first number
            displayLabel.text = number
            isInMiddleOfTypingANumber = true
        }
    }
    
    func enter() {
        isInMiddleOfTypingANumber = false
        stack.push(number: displayValue)
        // print the stack in the console for troubleshooting
        stack.log()
    }
    
    func operationButton(button: UIButton) {
        
        guard let operation = button.currentTitle else { return }
        
        if isInMiddleOfTypingANumber {
            enter()
        }
        
        // enter() if stack count is less than 2; otherwise perform operation with last 2 numbers added to the stack
        if stack.count() >= 2 {
            let stack1 = stack.pop()!
            let stack2 = stack.pop()!
            
            switch operation {
            case "+":
                displayValue = stack2 + stack1
            case "-":
                displayValue = stack2 - stack1
            case "x":
                displayValue = stack2 * stack1
            case "÷":
                displayValue = stack2 / stack1
            default:
                stack.push(number: stack2)
                stack.push(number: stack1)
            }
            
            enter()
        }
    }
    
    func clearButton() {
        displayValue = 0.0
    }
}

