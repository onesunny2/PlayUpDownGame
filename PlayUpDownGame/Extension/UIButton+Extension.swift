//
//  UIButton+Extension.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import UIKit

extension UIButton {
    
    // TODO: isEnabled = false 일 때, 글자색 커스텀 방법?
    func defaultButtonUI(_ title: String, _ bgcolor: UIColor) {
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        self.setTitle(title, for: .normal)
        self.tintColor = .white
        self.backgroundColor = bgcolor
        self.configuration?.attributedTitle = AttributedString(title, attributes: container)
        
    }
}
