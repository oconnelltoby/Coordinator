//
//  SecondaryViewController.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

import UIKit

class SecondaryCoordinator: Coordinating {
    weak var navigationController: UINavigationController?
    private let completion: () -> Void
    
    init(navigationController: UINavigationController, completion: @escaping () -> Void) {
        self.navigationController = navigationController
        self.completion = completion
    }
    
    func start() {
        showViewController(title: "1", nextButtonPressed: show2)
    }
    
    private func show2() {
        showViewController(title: "2", nextButtonPressed: show3)
    }
    
    private func show3() {
        showViewController(title: "3", nextButtonPressed: completion)
    }
    
    private func showViewController(title: String, nextButtonPressed: @escaping () -> Void) {
        let viewModel = ViewModel(title: title, nextButtonPressed: nextButtonPressed)
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
