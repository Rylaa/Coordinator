//
//  LoginFlow.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func loginCoordinatorDidFinish()
}

enum LoginFlowRouteType {
    case splash
    case login
    case home
}

protocol LoginRouteDelegate: AnyObject {
    func routeHandler(route: LoginFlowRouteType)
}

final class LoginFlowCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with type: LoginFlowRouteType) {
        routeHandler(route: type)
    }
    
    deinit {
        print("deinit \(self)")
    }
}

extension LoginFlowCoordinator: LoginRouteDelegate {
    func routeHandler(route: LoginFlowRouteType) {
        switch route {
        case .splash:
            let viewController = LoginFlowRouter.makeSplash(self)
            navigationController.pushViewController(viewController, animated: true)
        case .login:
            let viewController = LoginFlowRouter.makeLogin(self)
            navigationController.pushViewController(viewController, animated: true)
        case .home:
            delegate?.loginCoordinatorDidFinish()
        }
    }
}
