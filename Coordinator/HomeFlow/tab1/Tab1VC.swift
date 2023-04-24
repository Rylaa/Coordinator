//
//  ViewController.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

class Tab1VC: UIViewController {

    weak var delegate: Tab1VCRouteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .darkGray
        navigationItem.title = "XXX"
    }

    @IBAction func finish(_ sender: Any) {
        delegate?.tab1RouteHandler(route: .login)
    }
    
    deinit {
        print("deinit \(self)")
    }
}

extension Tab1VC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
