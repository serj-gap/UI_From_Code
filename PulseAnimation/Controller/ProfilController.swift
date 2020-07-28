//
//  ProfilController.swift
//  PulseAnimation
//
//  Created by Sergey Titov on 7/27/20.
//  Copyright © 2020 Sergey Titov. All rights reserved.
//

import Foundation
import UIKit

class ProfillController: UIViewController {
        
        private var login: String!
        private var name: String!
        
        private lazy var profileImageView: UIImageView = {
            let imageView = CustomImageView(image: UIImage(named: "cat"))
            return imageView
        }()
        
        private lazy var loginLabel: UILabel = {
            let label = UILabel()
            label.text = "Login: " + login
            label.font = UIFont(name: "Helvetica", size: 20)
            label.backgroundColor = .white
            return label
        }()
        
        private lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Name: " + name
            label.font = UIFont(name: "Helvetica", size: 20)
            label.backgroundColor = .white
            return label
        }()
        
        private lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(self.loginLabel)
            stackView.addArrangedSubview(self.nameLabel)
            
            stackView.spacing = 10
            stackView.alignment = .center
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            
            return stackView
        }()
        
        func setTitles(loginName: String, name: String) {
            self.login = loginName
            self.name = name
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
        }
        
        private func updateUI() {
            view.addSubview(profileImageView)
            view.addSubview(stackView)
            view.backgroundColor = .white
            
            setupAutolayout()
        }
        
        private func setupAutolayout() {
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            let constaints = [
                profileImageView.widthAnchor.constraint(equalToConstant: 400),
                profileImageView.heightAnchor.constraint(equalToConstant: 400),
                profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50),
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
            
            NSLayoutConstraint.activate(constaints)
        }

    }

