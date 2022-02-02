//
//  ViewModel.swift
//  Coordinator
//
//  Created by tobyoconnell on 15/10/2021.
//

struct ViewModel {
    var title: String
    var buttonTitle: String
    var nextButtonPressed: () -> Void
    
    enum DismissButtonType {
        case none
        case cross(action: () -> Void)
    }
    
    var dismissButtonType: DismissButtonType
}
