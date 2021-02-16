//
//  PrimaryColorCoordinator.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

struct PrimaryColorCoordinator: Coordinating {
    enum State {
        case red
        case green
        case blue
    }
    
    var navigationController: UINavigationController
    private let completion: () -> Void
    
    init(navigationController: UINavigationController, completion: @escaping () -> Void) {
        self.navigationController = navigationController
        self.completion = completion
    }
    
    func start() {
        set(state: .red)
    }
    
    func set(state: State) {
        navigationController.present(presentable(for: state))
        
    }
    
    private func presentable(for state: State) -> Presentable {
        switch state {
        case .red:
            return .screen(ViewController(title: "Red", color: .red) { set(state: .green) })
        case .green:
            return .screen(ViewController(title: "Green", color: .green) { set(state: .blue) })
        case .blue:
            return .screen(ViewController(title: "Blue", color: .blue, action: completion))
        }
    }
}
