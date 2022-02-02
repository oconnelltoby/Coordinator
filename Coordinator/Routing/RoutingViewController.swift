//
//  RoutingViewController.swift
//  Coordinator
//
//  Created by tobyoconnell on 02/11/2021.
//

import UIKit

class RoutingViewController: UIViewController {
    private let viewModel: RoutingViewModel
    
    init(viewModel: RoutingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let viewModel = ViewModel(
            title: viewModel.title,
            buttonTitle: viewModel.buttonTitle,
            nextButtonPressed: viewModel.router.nextButtonPressed
        )
        view = View(viewModel: viewModel)
    }
}
