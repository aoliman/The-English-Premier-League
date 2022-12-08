//
//  NotificationCenterManager.swift
//  MotoMoneyCore
//
//  Created by Mahmoud Elsheikh on 10/02/2022.
//

import Foundation


// MARK: Keychain wrapper
public enum NotificationCenterWrapper: String {
    case inValidToken = "InValidToken"
    case showLoading = "ShowLoading"
    case hideLoading = "HideLoading"
  
}

extension NotificationCenterWrapper {
    public func notify(with notificationData: AnyObject? = nil) {
        NotificationCenter.default.post(name: Notification.Name(self.rawValue), object: notificationData)
    }
    public func listen(observer: AnyObject, listner: Selector) {
        NotificationCenter.default.addObserver(observer,
                                               selector: listner,
                                               name: Notification.Name(self.rawValue), object: nil)
    }
    public func removeObserver(_ observer: AnyObject) {
        NotificationCenter.default.removeObserver(observer)
    }
}
