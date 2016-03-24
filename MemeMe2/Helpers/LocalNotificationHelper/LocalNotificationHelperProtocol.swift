//
//  LocalNotificationHelperProtocol.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


@objc protocol LocalNotificationHelperProtocol {

    func addObserver(observer: AnyObject, selector: Selector, name: String?, object: AnyObject?)
    func postNotification(notification: NSNotification)
    func postNotificationName(name: String, object: AnyObject?)
    func postNotificationName(name: String, object: AnyObject?, userInfo: [NSObject : AnyObject]?)
    func removeObserver(observer: AnyObject)
    func removeObserver(observer: AnyObject, name: String?, object: AnyObject?)
    func addKeyboardNotificationsObserver(observer: AnyObject, object: AnyObject?)

}
