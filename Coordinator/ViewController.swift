//
//  ViewController.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = View(viewModel: viewModel)
        if case let .cross(dismiss) = viewModel.dismissButtonType {
            let cross = UIImage(systemName: "xmark")!
            navigationItem.rightBarButtonItem = BarButtonItem(image: cross, action: dismiss)
        }
    }
}

