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
        showViewController(title: "A", buttonTitle: "Go to B", nextButtonPressed: showB)
    }
    
    private func showB() {
        showViewController(title: "B", buttonTitle: "Go to C", nextButtonPressed: showC)
    }
    
    private func showC() {
        showViewController(title: "C", buttonTitle: "Present modal", nextButtonPressed: showSecondaryCoordinator)
    }
    
    private func showSecondaryCoordinator() {
        ModalCoordinator(navigationController: navigationController, builder: SecondaryCoordinator.init).start()
    }
    
    private func showViewController(title: String, buttonTitle: String, nextButtonPressed: @escaping () -> Void) {
        let viewModel = ViewModel(title: title, buttonTitle: buttonTitle, nextButtonPressed: nextButtonPressed)
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
