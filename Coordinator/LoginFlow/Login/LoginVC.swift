//
//  LoginVC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

final class LoginVC: UIViewController {

    @IBOutlet private weak var startHomwFlow: UIButton!
    
    var viewModel: LoginVM!
    weak var delegate: LoginRouteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    @IBAction func show(_ sender: Any) {
        delegate?.routeHandler(route: .home)
    }
    
    deinit {
        print("deinit \(self)")
    }
}
extension LoginVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
