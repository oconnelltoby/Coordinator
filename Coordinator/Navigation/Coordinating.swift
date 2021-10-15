//
//  Coordinating.swift
//  Coordinator
//
//  Created by Toby O'Connell on 16/02/2021.
//

import UIKit

protocol Coordinating {
    var navigationController: UINavigationController? { get }
    func start() 
}
