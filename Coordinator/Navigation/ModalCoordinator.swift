//
//  ModalCoordinator.swift
//  Coordinator
//
//  Created by tobyoconnell on 16/10/2021.
//

import UIKit

class ModalCoordinator: Coordinating {
    weak var navigationController: UINavigationController?
    
    typealias Dismiss = () -> Void
    typealias CoordinatorBuilder = (UINavigationController, @escaping Dismiss) -> Coordinating
    private let builder: CoordinatorBuilder
    
    init(
        navigationController: UINavigationController?,
        builder: @escaping CoordinatorBuilder
    ) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func start() {
        showWrappedCoordinator()
    }
    
    private func showWrappedCoordinator() {
        let navigationController = UINavigationController()
        let completion = {
            self.navigationController?.dismiss(animated: true)
            return
        }
        builder(navigationController, completion).start()
        self.navigationController?.present(navigationController, animated: true)
    }
}
