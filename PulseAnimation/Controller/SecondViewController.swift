//
//  SecondViewController.swift
//  PulseAnimation
//
//  Created by Sergey Titov on 7/27/20.
//  Copyright © 2020 Sergey Titov. All rights reserved.
//

import Foundation
import UIKit



class SecondViewController: UIViewController {
    
    var constraint: NSLayoutConstraint?
    let registerController = RegistrationController()
 
   
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
        updateUI()
   backButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    
    private lazy var imageView: UIImageView = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 150, weight: .medium, scale: .large)
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.rectangle", withConfiguration: imageConfig))
        return imageView
    }()
    
    
    private lazy var registrLabel: UILabel = {
        let label = UILabel()
        label.text = "Register please"
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        return label
    }()
    
    
    
       
    
    private var backButton: UIButton =  {
      let button = UIButton(frame: CGRect(x: 130, y: 500, width: 100, height: 50))
              button.clipsToBounds = true
              button.layer.cornerRadius = button.frame.height / 2
              button.backgroundColor = .red
              button.setTitle("Registration", for: .normal)
              button.setTitleColor(.black, for: .normal)
              button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 25)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(registrLabel)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    private func setupAutoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        registrLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        constraint = backButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        
        let constraits = [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            backButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            constraint!
        ]
        
        NSLayoutConstraint.activate(constraits)
    }
    
     private func updateUI() {
           view.addSubview(stackView)
           view.addSubview(backButton)
           setupAutoLayout()
       }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        let pulse = PulseAnimation.init(numberOfPulses: 4, radius: 50, position: sender.center)
        pulse.animationDuration = 2.0
        pulse.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.view.layer.insertSublayer(pulse, above:  self.view.layer)
        
     
        registerController.modalPresentationStyle = .overFullScreen
        present(registerController, animated: true, completion: nil)
      
        
        
//        if let registerVC = delegate?.registerViewController {
//            registerVC.modalPresentationStyle = .fullScreen
//            registerVC.delegate = self.delegate
//            present(registerVC, animated: true, completion: nil)
//        }
    }
}
