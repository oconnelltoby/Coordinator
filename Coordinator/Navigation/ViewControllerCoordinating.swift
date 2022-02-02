//
//  ViewControllerCoordinating.swift
//  Coordinator
//
//  Created by tobyoconnell on 16/10/2021.
//

import UIKit

protocol ViewControllerCoordinating: Coordinating {}

enum ViewControllerButtonAction {
    case presentNext
    case custom(() -> Void)
}

enum PresentationType {
    case modal
    case push
}

extension ViewControllerCoordinating {
    private func showViewController(
        navigationController: UINavigationController?,
        title: String,
        buttonTitle: String,
        nextButtonPressed: @escaping () -> Void,
        dismissButtonType: ViewModel.DismissButtonType
    ) {
        let viewModel = ViewModel(
            title: title,
            buttonTitle: buttonTitle,
            nextButtonPressed: nextButtonPressed,
            dismissButtonType: dismissButtonType
        )
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showScreens(
        _ screens: (title: String, buttonTitle: String, action: ViewControllerButtonAction)...,
        presentationType: PresentationType
    ) {
        switch presentationType {
        case .modal:
            let navigationController = UINavigationController()
            showScreens(
                screens,
                navigationController: navigationController,
                dismissButtonType: .cross { [weak navigationController] in
                    navigationController?.dismiss(animated: true)
                }
            )
            self.navigationController?.present(navigationController, animated: true)
        case .push:
            showScreens(screens, navigationController: navigationController, dismissButtonType: .none)
        }
    }
    
    private func showScreens(
        _ screens: [(title: String, buttonTitle: String, action: ViewControllerButtonAction)],
        navigationController: UINavigationController?,
        dismissButtonType: ViewModel.DismissButtonType
    ) {
        screens.reversed().reduce(nil as (() -> Void)?) { presentNext, screen in
            let nextButtonPressed = {
                perform(action: screen.action, presentNext: presentNext)
            }
            return {
                showViewController(
                    navigationController: navigationController,
                    title: screen.title,
                    buttonTitle: screen.buttonTitle,
                    nextButtonPressed: nextButtonPressed,
                    dismissButtonType: dismissButtonType
                )
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
