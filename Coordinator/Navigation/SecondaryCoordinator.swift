//
//  SecondaryViewController.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

import UIKit

class SecondaryCoordinator: ViewControllerCoordinating {
    weak var navigationController: UINavigationController?
    private let completion: () -> Void
    let presentationType: PresentationType = .modal
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        completion = { [weak navigationController] in
            navigationController?.dismiss(animated: true)
        }
    }
    
    func start() {        
        showScreens(
            (title: "1", buttonTitle: "Go to 2", action: .presentNext),
            (title: "2", buttonTitle: "Go to 3", action: .presentNext),
            (title: "3", buttonTitle: "return", action: .custom(completion))
        )
    }
}
