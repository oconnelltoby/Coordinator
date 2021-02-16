//
//  View.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

class View: UIView {
    init(action: @escaping () -> Void) {
        super.init(frame: .zero)
        
        let button = Self.button(action: action)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private static func button(action: @escaping () -> Void) -> UIButton {
        let button = UIButton(primaryAction: .init { _ in action() })
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Next", for: .normal)
        return button
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
