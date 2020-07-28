//
//  RegistrationController.swift
//  PulseAnimation
//
//  Created by Sergey Titov on 7/27/20.
//  Copyright © 2020 Sergey Titov. All rights reserved.
//

import Foundation
import UIKit

class RegistrationController: UIViewController  {
    
    let userProfil = ProfillController()
    
    
        private lazy var textFields: Array<UITextField> = {
            var array = Array<UITextField>()
            for i in 0..<3 {
                let textField = UITextField()
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
                textField.layer.cornerRadius = 10
                switch i {
                case 0:
                    textField.placeholder = "Login"
                case 1:
                    textField.placeholder = "Name"
                case 2:
                    textField.placeholder = "Password"
                default:
                    break
                }
                array.append(textField)
            }
            return array
        }()
        
        private lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.alignment = .fill
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            
            textFields.forEach { stackView.addArrangedSubview($0) }
            
            return stackView
        }()

        private lazy var registrButton: UIButton = {
               let button = UIButton()
               button.isEnabled = false
               button.backgroundColor = .blue
               button.setTitle("Register", for: .normal)
               button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 25)
               return button
           }()
        
       
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
            
        }
        
        private func updateUI() {
            view.addSubview(stackView)
            view.addSubview(registrButton)
            view.backgroundColor = .white
            setupAutoLayout()
            setUpActions()
        }
        
        private func setUpActions() {
            let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(userTapped(_:)))
            
           registrButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            view.addGestureRecognizer(tapRecogniser)

        }
        
        private func setupAutoLayout() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            registrButton.translatesAutoresizingMaskIntoConstraints = false
            
            var constaits = [
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
                stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
                registrButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                registrButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                registrButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
                registrButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20) ]
            
            textFields.forEach { constaits.append($0.heightAnchor.constraint(equalToConstant: 50)) }
            
            NSLayoutConstraint.activate(constaits)
        }
        
        @objc func buttonTapped(_ sender: UIButton) {
            print("Register button tapped")
            
            
                       userProfil.setTitles(loginName: textFields[1].text!,
                                        name: textFields[0].text!)

                       userProfil.modalPresentationStyle = .fullScreen
                       present(userProfil, animated: true, completion: nil)
                   
        }
        
        @objc func userTapped(_ sender: UITapGestureRecognizer) {
            print("User tapped")
            
            
            if let login = textFields[0].text,
               let name = textFields[1].text,
               let password = textFields.last?.text {
               let charSet = CharacterSet.alphanumerics.union(CharacterSet.decimalDigits)
        if password.rangeOfCharacter(from: charSet) != nil && login != "" && name != "" {
                    registrButton.isEnabled = true
                    registrButton.backgroundColor = .blue
                } else {
                    registrButton.isEnabled = false
                    registrButton.backgroundColor = .gray
                }
            }
   
            view.endEditing(true)
        }
}
