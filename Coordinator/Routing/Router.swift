//
//  Router.swift
//  Coordinator
//
//  Created by tobyoconnell on 02/11/2021.
//

import UIKit

struct Router {
    weak var navigationController: UINavigationController?
    
    func nextButtonPressed() {
        ModalCoordinator(navigationController: navigationController, builder: SecondaryCoordinator.init).start()
    }
}
