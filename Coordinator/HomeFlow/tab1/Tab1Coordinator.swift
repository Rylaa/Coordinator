//
//  Tab2Coordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

protocol Tab1CoordinatorDelegate: AnyObject {
    func tab1CoordinatorDidFinish()
}

enum Tab1RouteType {
    case login
    case settings
}

protocol Tab1VCRouteDelegate: AnyObject {
    func tab1RouteHandler(route: Tab1RouteType)
}

final class Tab1Coordinator: Coordinator {
    var navigationController: UINavigationController
    weak var delegate: Tab1CoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = Tab1FlowRouter.make(self)
        viewController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "closeMenu"), selectedImage: nil)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    deinit {
        print("deinit \(self)")
    }
}

extension Tab1Coordinator: Tab1VCRouteDelegate {
    func tab1RouteHandler(route: Tab1RouteType) {
        switch route {
        case .login:
            navigationController.popViewController(animated: true)
            delegate?.tab1CoordinatorDidFinish()
        case .settings:
            /// ....
            print("")
        }
    }
}

