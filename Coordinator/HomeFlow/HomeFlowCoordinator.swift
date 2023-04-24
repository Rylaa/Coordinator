//
//  HomeFlowCoordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

protocol HomeFlowCoordinatorDelegate: AnyObject {
    func homeCoordinatorDidFinish()
}

enum HomeChildCoordinator {
    case tab1
    case tab2
}

final class HomeFlowCoordinator: NSObject, Coordinator {
    
    private var childCoordinators = [HomeChildCoordinator: Coordinator]()
    private var tabBarController: UITabBarController
    var navigationController: UINavigationController
    var delegate: HomeFlowCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        tabBarController = HomeViewController()
    }
    
    func start() {
        let controllers: [UINavigationController] = [getTab1(), getTab2()]

        tabBarController.setViewControllers(controllers, animated: true)
        tabBarController.delegate = self
        tabBarController.selectedIndex = .zero
        tabBarController.tabBar.isTranslucent = false

        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func getTab1() -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        
        let coordinator = Tab1Coordinator(navController)
        childCoordinators[.tab1] = coordinator
        coordinator.start()
        coordinator.delegate = self
        
        return navController
    }
    
    private func getTab2() -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        
        let coordinator = Tab2Coordinator(navController)
        childCoordinators[.tab2] = coordinator
        coordinator.start()
        coordinator.delegate = self
        
        return navController
    }
}

extension HomeFlowCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        print("######")
    }
}

extension HomeFlowCoordinator: Tab2CoordinatorDelegate {
    func tab2CoordinatorDidFinish() {
        navigationController.viewControllers.removeAll()
        childCoordinators.removeAll()
        delegate?.homeCoordinatorDidFinish()
    }
}

extension HomeFlowCoordinator: Tab1CoordinatorDelegate {
    func tab1CoordinatorDidFinish() {
        navigationController.viewControllers.removeAll()
        childCoordinators.removeAll()
        delegate?.homeCoordinatorDidFinish()
    }
}
