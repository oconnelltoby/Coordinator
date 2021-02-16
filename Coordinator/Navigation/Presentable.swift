//
//  Presentable.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

enum Presentable {
    case screen(UIViewController)
    case coordinator((UINavigationController) -> Coordinating)
}

extension UINavigationController {
    func present(_ presentable: Presentable) {
        switch presentable {
        case .screen(let viewController):
            pushViewController(viewController, animated: true)
        case .coordinator(let makeCoordinator):
            makeCoordinator(self).start()
        }
    }
}
