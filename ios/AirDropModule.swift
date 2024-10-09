import Foundation
import React
import UIKit

class AirDropActivityItemSource: NSObject, UIActivityItemSource {

    var link: String

    init(deepLink: String) {
        self.link = deepLink
        super.init()
    }

    // Provide the actual data that will be shared
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        // Returning a URL string to share
        return NSURL(string: "")!
    }

    // Provide the item based on the activity type
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        // Provide the URL only if AirDrop is selected
        if activityType == .airDrop {
            return NSURL(string: link)
        }
        // Returning nil for all other activity types
        return nil
    }
}
@objc(AirDropModule)
class AirDropModule: NSObject {

  @objc
  func shareDeepLink(_ deepLink: String) {
    DispatchQueue.main.async {
      // Use the custom AirDropActivityItemSource
      let itemSource = AirDropActivityItemSource(deepLink: deepLink)
      
      let controller = UIActivityViewController(activityItems: [itemSource], applicationActivities: nil)
      
      // Present the share sheet
      if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
        rootViewController.present(controller, animated: true, completion: nil)
      }
    }
  }

  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
