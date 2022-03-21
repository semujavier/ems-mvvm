//
//  WidgetView.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 21/3/22.
//

import Foundation
import UIKit

class WidgetBackgroundView: UIView {
    
    private var oldBgColor: UIColor?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    func setupView() {
        // corner radius
        layer.cornerRadius = 10

        // border
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor

        // shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4.0
    }

}
