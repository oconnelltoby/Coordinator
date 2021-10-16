//
//  InitialCoordinator.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

import UIKit

class InitialCoordinator: ViewControllerCoordinating {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showScreens(
            (title: "A", buttonTitle: "Go to B", action: .presentNext),
            (title: "B", buttonTitle: "Go to C", action: .presentNext),
            (title: "C", buttonTitle: "Present Modal", action: .custom(showSecondaryCoordinator))
        )
    }
    
    private func showSecondaryCoordinator() {
        ModalCoordinator(navigationController: navigationController, builder: SecondaryCoordinator.init).start()
    }
}
