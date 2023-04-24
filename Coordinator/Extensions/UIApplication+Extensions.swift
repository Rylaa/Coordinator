//
//  UIApplication+Extensions.swift
//  IsFaktoring
//
//  Created by yusuf demirkoparan on 6.12.2021.
//

import Foundation
import UIKit

extension UIApplication {
    static func getTopViewController() -> UIViewController? {
        if #available(iOS 13, *){
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if var topController = keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                return topController
            }
        } else {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                return topController
            }
        }
        return nil
    }
        
}
