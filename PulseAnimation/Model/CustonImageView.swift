//
//  CustonImageView.swift
//  PulseAnimation
//
//  Created by Sergey Titov on 7/28/20.
//  Copyright © 2020 Sergey Titov. All rights reserved.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    private func configure() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = bounds.width / 2
        self.layer.borderColor = UIColor.cyan.cgColor
        self.layer.borderWidth = 3
    }

}
