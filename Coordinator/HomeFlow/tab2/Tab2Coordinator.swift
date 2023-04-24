//
//  tab2Coordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan 
//

import UIKit

protocol Tab2CoordinatorDelegate: AnyObject {
    func tab2CoordinatorDidFinish()
}

protocol Tab2VCRouteDelegate: AnyObject {
    func tab2RouteHandler(route: Tab2RouteType)
}

enum Tab2RouteType {
    case present
    case finish
}

final class Tab2Coordinator: Coordinator {
    var navigationController: UINavigationController
    weak var delegate: Tab2CoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("deinit \(self)")
    }
    
    func start()  {
        let viewController = Tab2FlowRouter.make(self)
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "closeMenu"), selectedImage: nil)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension Tab2Coordinator: Tab2VCRouteDelegate {
    func tab2RouteHandler(route: Tab2RouteType) {
        switch route {
        case .present:
            let presentVC = Tab2FlowRouter.showPresentVC(self)
            navigationController.present(presentVC, animated: true)
        case .finish:
            navigationController.dismiss(animated: true)
        }
    }
}

extension Tab2Coordinator: PresentVCRouteDelegate {
    func finish() {
       print("finish tapped")
    }
}




