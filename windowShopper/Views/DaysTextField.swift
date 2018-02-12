//
//  DaysTextField.swift
//  windowShopper
//
//  Created by kalle hallden on 2018-01-22.
//  Copyright © 2018 Elite Athlete Coaching. All rights reserved.
//

import UIKit
@IBDesignable
class DaysTextField: UITextField {
    
        override func prepareForInterfaceBuilder() {
            customizeView()
        }
        override func awakeFromNib() {
            super.awakeFromNib()
            customizeView()
        }
        
        func customizeView() {
            backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.2539865154)
            layer.cornerRadius = 5.0
            textAlignment = .center
            
            clipsToBounds = true
            
            if let p = placeholder {
                let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
                attributedPlaceholder = place
                textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
}
