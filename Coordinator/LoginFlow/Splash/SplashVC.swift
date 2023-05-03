//
//  SplashVC.swift
//  IsFaktoring
//
//  Created by yusuf demirkoparan on 6.12.2021.
//

import UIKit

final class SplashVC: UIViewController {
    
    var delegate: LoginRouteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.delegate?.routeHandler(route: .login)
        }
    }
    
    deinit {
        print("deinit \(self)")
    }
}

extension SplashVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
