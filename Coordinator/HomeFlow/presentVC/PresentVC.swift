//
//  PresentVC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import UIKit

protocol PresentVCRouteDelegate: AnyObject {
    func finish()
}

final class PresentVC: UIViewController {
    
    var delegate: PresentVCRouteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() 
    }
    
    func setupUI() {
        navigationItem.title = "Present"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "closeMenu"), style: .plain, target: self, action: #selector(dismissView))
        view.backgroundColor = UIColor.red
    }
    
    @objc func dismissView() {
        delegate?.finish()
        dismiss(animated: true)
    }
    
    deinit {
        print("deinit \(self)")
    }
}
