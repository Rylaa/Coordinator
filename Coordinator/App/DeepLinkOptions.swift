//
//  DeepLinkOptions.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan
//

import Foundation

struct DeepLinkURLConstants {
  static let Item = "items"
}

enum DeepLinkOption {
  case item(String?)
}


extension DeepLinkOption {
    static func returnDeeplinkOption(url: URL) -> DeepLinkOption? {
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            var pathComponents = components.path.components(separatedBy: "/")
            pathComponents.removeFirst()
            
            switch pathComponents.first {
            case DeepLinkURLConstants.Item:
                return .item(pathComponents.last)
                
            default:
                return nil
            }
        }
        return nil
    }
    
    static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
      if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
        let url = userActivity.webpageURL,
        let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
        //TODO: gelen url'e göre return edilmesi gerek.
      }
      return nil
    }
    
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
      guard let id = dict?["launch_id"] as? String else { return nil } // url'
      
      let itemID = dict?["item_id"] as? String
      
      switch id {
        case DeepLinkURLConstants.Item: return .item(itemID)
        default: return nil
      }
    }
}
