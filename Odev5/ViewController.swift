//
//  ViewController.swift
//  Odev5
//
//  Created by Sinan Sezer on 4.10.2022.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var runningNumber = ""
    var firstNumber = ""
    var secondNumber = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "0"
        
    }

    @IBAction func numberButton(_ sender: UIButton) {
        if runningNumber.count <= 9 {
            runningNumber += "\(sender.tag)"
            resultLabel.text = runningNumber
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        runningNumber = ""
        firstNumber = ""
        secondNumber = ""
        result = ""
        currentOperation = .Null
        resultLabel.text = "0"
    }
    
    @IBAction func commaButton(_ sender: UIButton) {
        if runningNumber.count <= 8 {
            runningNumber += ","
            resultLabel.text = runningNumber
        }
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation:Operation) {
        if currentOperation != .Null {
            if runningNumber != "" {
                secondNumber = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(firstNumber)! + Double(secondNumber)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(firstNumber)! - Double(secondNumber)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(firstNumber)! * Double(secondNumber)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(firstNumber)! / Double(secondNumber)!)"
                }
                
                firstNumber = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                resultLabel.text = result
            }
            
            currentOperation = operation
            
        } else{
            firstNumber = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

