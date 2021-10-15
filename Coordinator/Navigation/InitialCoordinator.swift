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
        showViewController(title: "A", nextButtonPressed: showB)
    }
    
    private func showB() {
        showViewController(title: "B", nextButtonPressed: showC)
    }
    
    private func showC() {
        showViewController(title: "C", nextButtonPressed: showSecondaryCoordinator)
    }
    
    private func showSecondaryCoordinator() {
        let navigationController = UINavigationController()
        let completion = {
            self.navigationController?.dismiss(animated: true)
            return
        }
        SecondaryCoordinator(navigationController: navigationController, completion: completion).start()
        self.navigationController?.present(navigationController, animated: true)
    }
    
    private func showViewController(title: String, nextButtonPressed: @escaping () -> Void) {
        let viewModel = ViewModel(title: title, nextButtonPressed: nextButtonPressed)
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
