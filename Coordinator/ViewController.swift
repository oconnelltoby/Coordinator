//
//  ViewController.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

class ViewController: UIViewController {
    init(title: String, color: UIColor, action: @escaping () -> Void) {
        super.init(nibName: nil, bundle: nil)
        
        view = View(action: action)
        view.backgroundColor = color
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

