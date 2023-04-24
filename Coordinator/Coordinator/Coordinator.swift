//
//  Coordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start(_ startType: AppStartType)
    func start(with option: DeepLinkOption?)
}

enum AppStartType {
    case Splash
    case LoginFlow
    case HomeFlow
}

extension Coordinator {
    func start(with option: DeepLinkOption?) {
        start(with: option)
    }
    
    func start(_ startType: AppStartType) {
        start(startType)
    }
}
