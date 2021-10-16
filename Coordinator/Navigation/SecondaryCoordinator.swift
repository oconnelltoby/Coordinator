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
    
    init(navigationController: UINavigationController, completion: @escaping () -> Void) {
        self.navigationController = navigationController
        self.completion = completion
    }
    
    func start() {        
        showScreens(
            (title: "1", buttonTitle: "Go to 2", action: .presentNext),
            (title: "2", buttonTitle: "Go to 3", action: .presentNext),
            (title: "3", buttonTitle: "return", action: .custom(completion))
        )
    }
}
