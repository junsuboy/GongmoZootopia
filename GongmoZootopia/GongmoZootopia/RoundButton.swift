//
//  RoundButton.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/07.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = 15
            }
        }
    }
}
