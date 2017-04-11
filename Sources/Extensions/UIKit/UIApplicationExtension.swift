//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public extension UIApplication {

    public func topViewController(_ baseVC: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        guard let baseVC = baseVC else {
            return nil
        }

        if let nav = baseVC as? UINavigationController {
            return topViewController(nav.visibleViewController)
        } else if let tab = baseVC as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(selected)
        } else if let presented = baseVC.presentedViewController {
            return topViewController(presented)
        }
        return baseVC
    }

}
