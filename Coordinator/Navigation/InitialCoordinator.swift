//
//  InitialViewController.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

struct InitialCoordinator: Coordinating {
    enum State {
        case primaryColor
        case secondaryColor
    }
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        set(state: .primaryColor)
    }
    
    func set(state: State) {
        navigationController.present(presentable(for: state))
        
    }
    
    private func restart() {
        navigationController.popToRootViewController(animated: true)
    }
    
    private func presentable(for state: State) -> Presentable {
        switch state {
        case .primaryColor:
            return .coordinator {
                PrimaryColorCoordinator(navigationController: $0) {
                    set(state: .secondaryColor)
                }
            }
        case .secondaryColor:
            return .coordinator {
                SecondaryColorCoordinator(navigationController: $0) {
                    navigationController.showAlert(completion: restart)
                }
            }
        }
    }
}

private extension UINavigationController {
    func showAlert(completion: @escaping () -> Void) {
        let alert = UIAlertController(title: "Finished", message: "Do you want to restart?", preferredStyle: .alert)
        alert.addAction(.init(title: "Yes", style: .default, handler: { _ in completion() }))
        alert.addAction(.init(title: "No", style: .cancel))
        present(alert, animated: true)
    }
}
