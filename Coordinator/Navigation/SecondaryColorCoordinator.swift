//
//  PrimaryColorCoordinator.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

struct SecondaryColorCoordinator: Coordinating {
    enum State {
        case cyan
        case yellow
        case magenta
    }
    
    var navigationController: UINavigationController
    private let completion: () -> Void
    
    init(navigationController: UINavigationController, completion: @escaping () -> Void) {
        self.navigationController = navigationController
        self.completion = completion
    }
    
    func start() {
        set(state: .cyan)
    }
    
    func set(state: State) {
        navigationController.present(presentable(for: state))
        
    }
    
    private func presentable(for state: State) -> Presentable {
        switch state {
        case .cyan:
            return .screen(ViewController(title: "Cyan", color: .cyan) { set(state: .magenta) })
        case .magenta:
            return .screen(ViewController(title: "Magenta", color: .magenta) { set(state: .yellow) })
        case .yellow:
            return .screen(ViewController(title: "Yellow", color: .yellow, action: completion))
        }
    }
}
