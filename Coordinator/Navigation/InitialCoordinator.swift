//
//  InitialCoordinator.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

import UIKit

class InitialCoordinator: Coordinating {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ViewModel(title: "A", nextButtonPressed: showB)
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    private func showB() {
        let viewModel = ViewModel(title: "B", nextButtonPressed: {})
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
