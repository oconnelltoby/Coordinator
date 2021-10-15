//
//  View.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

import UIKit

class View: UIView {
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    init(viewModel: ViewModel) {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        
        let action = UIAction { _ in
            viewModel.nextButtonPressed()
        }
        
        button.addAction(action, for: .touchUpInside)
        button.setTitle(viewModel.buttonTitle, for: .normal)
        
        addSubview(button)
                
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
