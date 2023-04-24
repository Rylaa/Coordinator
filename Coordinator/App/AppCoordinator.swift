//
//  MainCoordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

enum AppChildCoordinator {
    case home
    case login
}

final class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators = [AppChildCoordinator: Coordinator]()
    var navigationController: UINavigationController
    var deepLinkType: DeepLinkOption?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    func start(_ startType: AppStartType) {
        switch startType {
        case .Splash:
            showLoginFlow(with: .splash)
        case .LoginFlow:
            showLoginFlow(with: .login)
        case .HomeFlow:
            showHomeFlow()
        }
    }
    
    func start(with option: DeepLinkOption?) {
        switch option {
        case .item(let data):
            showHomeFlow()
        case .none:
            showHomeFlow()
        }
    }
}

extension AppCoordinator {
    func showHomeFlow() {
        let homeCoordinator = HomeFlowCoordinator(navigationController)
        childCoordinators[.home] = homeCoordinator
        homeCoordinator.start()
        homeCoordinator.delegate = self
    }
    
    func showLoginFlow(with type: LoginFlowRouteType) {
        let loginCoordinator = LoginFlowCoordinator(navigationController)
        childCoordinators[.login] = loginCoordinator
        loginCoordinator.start(with: type)
        loginCoordinator.delegate = self
    }
}

extension AppCoordinator: HomeFlowCoordinatorDelegate {
    func homeCoordinatorDidFinish() {
        showLoginFlow(with: .login)
        childCoordinators[.home] = nil
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginCoordinatorDidFinish() {
        navigationController.popToRootViewController(animated: true)
        showHomeFlow()
        childCoordinators[.login] = nil
    }
}
