//
//  PulseAnimacionController.swift
//  PulseAnimation
//
//  Created by Sergey Titov on 7/26/20.
//  Copyright © 2020 Sergey Titov. All rights reserved.
//

import UIKit
import Foundation


class PulseAnimacionController: UIViewController {
    
    let secondController = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pulseButton)
        pulseButton.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
    }
    

    private var pulseButton: UIButton =  {
      let button = UIButton(frame: CGRect(x: 140, y: 300, width: 100, height: 100))
              button.clipsToBounds = true
              button.layer.cornerRadius = button.frame.height / 2
              button.backgroundColor = .red
              button.setTitle("HI", for: .normal)
              button.setTitleColor(.black, for: .normal)
              button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 25)
        return button
    }()
    
    
    @objc func addAction(_ sender: UIButton) {
        let pulse = PulseAnimation.init(numberOfPulses: 5, radius: 100, position: sender.center)
        pulse.animationDuration = 3.0
        pulse.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.view.layer.insertSublayer(pulse, above:  self.view.layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
            self.buttonTapped()
        }
    }
    
     func buttonTapped() {
        secondController.modalTransitionStyle = .crossDissolve
        present(secondController, animated: true, completion: nil)
    }
}


