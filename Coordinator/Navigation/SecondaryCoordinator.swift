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
        showViewController(title: "1", buttonTitle: "Go to 2", nextButtonPressed: show2)
    }
    
    private func show2() {
        showViewController(title: "2", buttonTitle: "Go to 3", nextButtonPressed: show3)
    }
    
    private func show3() {
        showViewController(title: "3", buttonTitle: "return", nextButtonPressed: completion)
    }
    
    private func showViewController(title: String, buttonTitle: String, nextButtonPressed: @escaping () -> Void) {
        let viewModel = ViewModel(title: title, buttonTitle: buttonTitle, nextButtonPressed: nextButtonPressed)
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
