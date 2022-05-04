//
//  PaddingZuganLabel.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/05/04.
//

import Foundation
import UIKit

@IBDesignable class PaddingZuganLabel: UILabel {
    
    @IBInspectable var topPadding: CGFloat = 1.0
    @IBInspectable var leftPadding: CGFloat = 1.5
    @IBInspectable var bottomPadding: CGFloat = 1.0
    @IBInspectable var rightPadding: CGFloat = 1.5
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.topPadding = padding.top
        self.leftPadding = padding.left
        self.bottomPadding = padding.bottom
        self.rightPadding = padding.right
    }
    
    override func drawText(in rect: CGRect) {
        let padding = UIEdgeInsets.init(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += self.leftPadding + self.rightPadding
        contentSize.height += self.topPadding + self.bottomPadding
        return contentSize
    }
}
