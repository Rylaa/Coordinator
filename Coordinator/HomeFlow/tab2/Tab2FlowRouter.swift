//
//  Tab2FlowRouter.swift
//  Coordinator
//
//  Created by Yusuf Demirkoparan on 23.04.2023.
//

import UIKit

struct Tab2FlowRouter {
    static func make(_ coordinator: Tab2VCRouteDelegate) -> Tab2VC {
        let viewController = Tab2VC.instantiate()
        viewController.delegate = coordinator
     
        return viewController
    }
    
    static func showPresentVC(_ coordinator: PresentVCRouteDelegate) -> UIViewController {
        let vc = PresentVC()
        vc.delegate = coordinator
        
        return UINavigationController(rootViewController: vc)
    }
}
