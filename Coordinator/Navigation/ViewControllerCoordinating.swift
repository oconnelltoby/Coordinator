//
//  ViewControllerCoordinating.swift
//  Coordinator
//
//  Created by tobyoconnell on 16/10/2021.
//

protocol ViewControllerCoordinating: Coordinating {}

enum ViewControllerButtonAction {
    case presentNext
    case custom(() -> Void)
}

extension ViewControllerCoordinating {
    func showViewController(title: String, buttonTitle: String, nextButtonPressed: @escaping () -> Void) {
        let viewModel = ViewModel(title: title, buttonTitle: buttonTitle, nextButtonPressed: nextButtonPressed)
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showViewControllers(screens: [(title: String, buttonTitle: String, action: ViewControllerButtonAction)]) {
        screens.reversed().reduce(nil as (() -> Void)?) { presentNext, screen in
            let nextButtonPressed = {
                perform(action: screen.action, presentNext: presentNext)
            }
            return {
                showViewController(title: screen.title, buttonTitle: screen.buttonTitle, nextButtonPressed: nextButtonPressed)
            }
        }?()
    }
    
    private func perform(action: ViewControllerButtonAction, presentNext: (() -> Void)?) {
        switch action {
        case .presentNext:
            presentNext?()
        case .custom(let action):
            action()
        }
    }
}
