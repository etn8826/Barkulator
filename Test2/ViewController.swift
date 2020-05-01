//
//  ViewController.swift
//  Test2
//
//  Created by Einstein Nguyen on 4/14/20.
//  Copyright © 2020 Einstein Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var num1 = PawButton()
    var num2 = PawButton()
    var num3 = PawButton()
    var num4 = PawButton()
    var num5 = PawButton()
    var num6 = PawButton()
    var num7 = PawButton()
    var num8 = PawButton()
    var num9 = PawButton()
    var num0 = PawButton()
    var decimal = PawButton()
    var inverse = PawButton()
    var addFunc = PawButton()
    var subFunc = PawButton()
    var multiplyFunc = PawButton()
    var divideFunc = PawButton()
    var equalFunc = PawButton()
    var backspaceFunc = PawButton()
    var clearFunc = PawButton()
    var clearAllFunc = PawButton()
    
    var computationTextView = UILabel()
    var functionLabel = UILabel()
    
    var value1 = 0.00
    var value2 = 0.00
    var total  = 0.00
    
    var didSelectFunction = false
    
    let url = Bundle.main.url(forResource: "dog", withExtension: "m4a")
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.view.backgroundColor = UIColor(red: (122.0/255.0), green: (232.0/255.0), blue: (171.0/255.0), alpha: 1.0)
        let bg = UIImageView(image: UIImage(named: "bg"))
        view.addSubview(bg)
        setupViews()
        
        for subview in self.view.subviews {
            if let button = subview as? PawButton {
                addActionToButton(button: button)
            }
        }
    }
    
    func setupViews() {
        // Setup UI and constraints for view
        num1.setTitle("1", for: .normal)
        num2.setTitle("2", for: .normal)
        num3.setTitle("3", for: .normal)
        num4.setTitle("4", for: .normal)
        num5.setTitle("5", for: .normal)
        num6.setTitle("6", for: .normal)
        num7.setTitle("7", for: .normal)
        num8.setTitle("8", for: .normal)
        num9.setTitle("9", for: .normal)
        num0.setTitle("0", for: .normal)
        decimal.setTitle(".", for: .normal)
        inverse.setTitle("+/-", for: .normal)
        addFunc.setTitle("+", for: .normal)
        subFunc.setTitle("-", for: .normal)
        multiplyFunc.setTitle("x", for: .normal)
        divideFunc.setTitle("/", for: .normal)
        equalFunc.setTitle("=", for: .normal)
        backspaceFunc.setTitle("<-", for: .normal)
        clearFunc.setTitle("C", for: .normal)
        clearAllFunc.setTitle("CE", for: .normal)

        computationTextView.backgroundColor = .clear
        computationTextView.font = UIFont(name: "Courier-Bold", size: 50)
        computationTextView.textColor = .brown
        computationTextView.isUserInteractionEnabled = false
        computationTextView.textAlignment = .center
        computationTextView.adjustsFontSizeToFitWidth = true
        
        functionLabel.backgroundColor = .clear
        functionLabel.font = UIFont(name: "Courier-Bold", size: 70)
        functionLabel.textColor = .brown
        functionLabel.isUserInteractionEnabled = false
        functionLabel.textAlignment = .center
        functionLabel.adjustsFontSizeToFitWidth = true
        
        view.addSubview(num1)
        view.addSubview(num2)
        view.addSubview(num3)
        view.addSubview(num4)
        view.addSubview(num5)
        view.addSubview(num6)
        view.addSubview(num7)
        view.addSubview(num8)
        view.addSubview(num9)
        view.addSubview(num0)
        view.addSubview(decimal)
        view.addSubview(inverse)
        view.addSubview(addFunc)
        view.addSubview(subFunc)
        view.addSubview(multiplyFunc)
        view.addSubview(divideFunc)
        view.addSubview(equalFunc)
        view.addSubview(backspaceFunc)
        view.addSubview(clearFunc)
        view.addSubview(clearAllFunc)
        view.addSubview(computationTextView)
        view.addSubview(functionLabel)
        
        computationTextView.translatesAutoresizingMaskIntoConstraints = false
        computationTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        computationTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        computationTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        computationTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        functionLabel.translatesAutoresizingMaskIntoConstraints = false
        functionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        functionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        functionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        functionLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        equalFunc.translatesAutoresizingMaskIntoConstraints = false
        equalFunc.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        equalFunc.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        equalFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        equalFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        decimal.translatesAutoresizingMaskIntoConstraints = false
        decimal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        decimal.rightAnchor.constraint(equalTo: equalFunc.leftAnchor, constant: -20).isActive = true
        decimal.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        decimal.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        inverse.translatesAutoresizingMaskIntoConstraints = false
        inverse.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        inverse.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        inverse.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        inverse.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num0.translatesAutoresizingMaskIntoConstraints = false
        num0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        num0.rightAnchor.constraint(equalTo: decimal.leftAnchor, constant: -20).isActive = true
        num0.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num0.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num1.translatesAutoresizingMaskIntoConstraints = false
        num1.bottomAnchor.constraint(equalTo: num0.topAnchor, constant: -10).isActive = true
        num1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        num1.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num1.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num2.translatesAutoresizingMaskIntoConstraints = false
        num2.bottomAnchor.constraint(equalTo: num0.topAnchor, constant: -10).isActive = true
        num2.leftAnchor.constraint(equalTo: num1.rightAnchor, constant: 20).isActive = true
        num2.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num2.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num3.translatesAutoresizingMaskIntoConstraints = false
        num3.bottomAnchor.constraint(equalTo: num0.topAnchor, constant: -10).isActive = true
        num3.leftAnchor.constraint(equalTo: num2.rightAnchor, constant: 20).isActive = true
        num3.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num3.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        addFunc.translatesAutoresizingMaskIntoConstraints = false
        addFunc.bottomAnchor.constraint(equalTo: num0.topAnchor, constant: -10).isActive = true
        addFunc.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        addFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        addFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num4.translatesAutoresizingMaskIntoConstraints = false
        num4.bottomAnchor.constraint(equalTo: num2.topAnchor, constant: -10).isActive = true
        num4.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        num4.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num4.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num5.translatesAutoresizingMaskIntoConstraints = false
        num5.bottomAnchor.constraint(equalTo: num2.topAnchor, constant: -10).isActive = true
        num5.leftAnchor.constraint(equalTo: num4.rightAnchor, constant: 20).isActive = true
        num5.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num5.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num6.translatesAutoresizingMaskIntoConstraints = false
        num6.bottomAnchor.constraint(equalTo: num2.topAnchor, constant: -10).isActive = true
        num6.leftAnchor.constraint(equalTo: num5.rightAnchor, constant: 20).isActive = true
        num6.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num6.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        subFunc.translatesAutoresizingMaskIntoConstraints = false
        subFunc.bottomAnchor.constraint(equalTo: num2.topAnchor, constant: -10).isActive = true
        subFunc.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        subFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        subFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num7.translatesAutoresizingMaskIntoConstraints = false
        num7.bottomAnchor.constraint(equalTo: num5.topAnchor, constant: -10).isActive = true
        num7.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        num7.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num7.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num8.translatesAutoresizingMaskIntoConstraints = false
        num8.bottomAnchor.constraint(equalTo: num5.topAnchor, constant: -10).isActive = true
        num8.leftAnchor.constraint(equalTo: num7.rightAnchor, constant: 20).isActive = true
        num8.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num8.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        num9.translatesAutoresizingMaskIntoConstraints = false
        num9.bottomAnchor.constraint(equalTo: num5.topAnchor, constant: -10).isActive = true
        num9.leftAnchor.constraint(equalTo: num8.rightAnchor, constant: 20).isActive = true
        num9.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        num9.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        multiplyFunc.translatesAutoresizingMaskIntoConstraints = false
        multiplyFunc.bottomAnchor.constraint(equalTo: num5.topAnchor, constant: -10).isActive = true
        multiplyFunc.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        multiplyFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        multiplyFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        divideFunc.translatesAutoresizingMaskIntoConstraints = false
        divideFunc.bottomAnchor.constraint(equalTo: num8.topAnchor, constant: -10).isActive = true
        divideFunc.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        divideFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        divideFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        
        backspaceFunc.translatesAutoresizingMaskIntoConstraints = false
        backspaceFunc.bottomAnchor.constraint(equalTo: num8.topAnchor, constant: -10).isActive = true
        backspaceFunc.rightAnchor.constraint(equalTo: divideFunc.leftAnchor, constant: -20).isActive = true
        backspaceFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        backspaceFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        clearFunc.translatesAutoresizingMaskIntoConstraints = false
        clearFunc.bottomAnchor.constraint(equalTo: num8.topAnchor, constant: -10).isActive = true
        clearFunc.rightAnchor.constraint(equalTo: backspaceFunc.leftAnchor, constant: -20).isActive = true
        clearFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        clearFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        
        clearAllFunc.translatesAutoresizingMaskIntoConstraints = false
        clearAllFunc.bottomAnchor.constraint(equalTo: num8.topAnchor, constant: -10).isActive = true
        clearAllFunc.rightAnchor.constraint(equalTo: clearFunc.leftAnchor, constant: -20).isActive = true
        clearAllFunc.heightAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
        clearAllFunc.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 - 20).isActive = true
    }
    
    func addActionToButton(button: PawButton) {
        //Setup button actions
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: PawButton) {
        sender.buttonShake()

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.play()
        } catch {
            print("couldn't load file :(")
        }

        if let value = sender.titleLabel?.text {
            if value.isNumeric {
                if ((computationTextView.text?.rangeOfCharacter(from: CharacterSet(charactersIn: "."))) != nil) && value == "." {
                    return
                }

                if didSelectFunction {
                    computationTextView.text = ""
                    didSelectFunction = false
                }

                computationTextView.text = ((computationTextView.text ?? "") + value)
            } else if (!value.isNumeric && computationTextView.text != nil) {
                switch value.function {
                case .add:
                    storeValue()
                    functionLabel.text = "+"
                    print("add")
                case .sub:
                    storeValue()
                    functionLabel.text = "-"
                    print("sub")
                case .multiply:
                    storeValue()
                    functionLabel.text = "x"
                    print("multiply")
                case .divide:
                    storeValue()
                    functionLabel.text = "/"
                    print("divide")
                case .inverse:
                    invertValue()
                    print("inverse")
                case .equal:
                    storeValue()
                    functionLabel.text = "="
                    print("equal")
                case .backspace:
                    if (computationTextView.text != nil && computationTextView.text != "") {
                        _ = computationTextView.text?.removeLast()
                    }
                    print("backspace")
                case .clear:
                    computationTextView.text = ""
                    print("clear")
                case .clearAll:
                    computationTextView.text = ""
                    functionLabel.text = ""
                    value1 = 0.00
                    value2 = 0.00
                    didSelectFunction = false
                    print("clear all")
                }
            }
        }
    }
    
    func storeValue() {
        didSelectFunction = true
        if value1 == 0.00 {
            value1 = Double((computationTextView.text! as NSString).floatValue)
        } else if (value2 == 0.00) {
            value2 = Double((computationTextView.text! as NSString).floatValue)
            calculations()
        } else {
            value1 = Double((computationTextView.text! as NSString).floatValue)
            calculations()
            value2 = 0.00
        }
    }
    
    func calculations() {
        switch functionLabel.text?.function {
        case .add:
            total = value1 + value2
        case .sub:
            total = value1 - value2
        case .multiply:
            total = value1 * value2
        case .divide:
            total = value1 / value2
        default:
            return
        }
        
        computationTextView.text = String(format:"%f", total)
    }
    
    func invertValue() {
        if computationTextView.text?.prefix(1) == "-" {
            _ = computationTextView.text?.removeFirst()
        } else {
            computationTextView.text = "-" + (computationTextView.text ?? "")
        }
    }
}

enum Function: String {
    case add = "+"
    case sub = "-"
    case multiply = "x"
    case divide = "/"
    case equal = "="
    case backspace = "<-"
    case clear = "C"
    case clearAll = "CE"
    case inverse = "+/-"
}

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        return Set(self).isSubset(of: nums)
    }
    
    var function: Function {
        switch self {
        case "+":   return .add
        case "-":   return .sub
        case "x":   return .multiply
        case "/":   return .divide
        case "<-":  return .backspace
        case "=":   return .equal
        case "C":   return .clear
        case "CE":  return .clearAll
        case "+/-": return .inverse
        default:    return .clearAll
        }
    }
}
