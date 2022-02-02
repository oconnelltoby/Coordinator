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
            (title: "C", buttonTitle: "Show Routing Screen", action: .custom(showRoutingViewController))
        )
    }
    
    private func showRoutingViewController() {
        let router = Router(navigationController: navigationController)
        let viewModel = RoutingViewModel(title: "Routing", buttonTitle: "Present Modal", router: router)
        let viewController = RoutingViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
