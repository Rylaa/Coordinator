//
//  Tab1FlowRouter.swift
//  Coordinator
//
//  Created by Yusuf Demirkoparan on 23.04.2023.
//

import Foundation

struct Tab1FlowRouter {
    static func make(_ coordinator: Tab1Coordinator) -> Tab1VC {
        let viewController = Tab1VC.instantiate()
        viewController.delegate = coordinator
       
        return viewController
    }
}
