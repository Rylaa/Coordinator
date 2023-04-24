//
//  Test1VC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit


final class Tab2VC: UIViewController {
    
    weak var delegate: Tab2VCRouteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
        
    @IBAction func show(_ sender: Any) {
        delegate?.tab2RouteHandler(route: .present)
    }
    
    deinit {
        print("deinit \(self)")
    }
}

extension Tab2VC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
