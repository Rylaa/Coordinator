//
//  LoginFlowRouter.swift
//  Coordinator
//
//  Created by Yusuf Demirkoparan on 23.04.2023.
//

import Foundation

struct LoginFlowRouter {
    static func makeLogin(_ coordinator: AnyObject) -> LoginVC {
        let viewController = LoginVC.instantiate()
        let viewModel = LoginVM()
        viewController.viewModel = viewModel
    
        if let delegate = coordinator as? LoginRouteDelegate {
            viewController.delegate = delegate
        }
        
        return viewController
    }
    
    static func makeSplash(_ coordinator: AnyObject) -> SplashVC {
        let viewController = SplashVC.instantiate()
        
        if let delegate = coordinator as? LoginRouteDelegate {
            viewController.delegate = delegate
        }
        
        return viewController
    }
}
