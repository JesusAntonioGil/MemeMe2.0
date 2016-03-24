//
//  LocalNotificationHelper.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


private let keyboardWillShowSelector: Selector = "keyboardWillShow:"
private let keyboardWillHideSelector: Selector = "keyboardWillHide:"


class LocalNotificationHelper: NSObject, LocalNotificationHelperProtocol {

    //Injected
    var defaultCenter: NSNotificationCenter!
    
    
    //MARK: PUBLIC
    
    func addObserver(observer: AnyObject, selector: Selector, name: String?, object: AnyObject?) {
        defaultCenter.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    func postNotification(notification: NSNotification) {
        defaultCenter.postNotification(notification)
    }
    
    func postNotificationName(name: String, object: AnyObject?) {
        defaultCenter.postNotificationName(name, object: object)
    }
    
    func postNotificationName(name: String, object: AnyObject?, userInfo: [NSObject : AnyObject]?) {
        defaultCenter.postNotificationName(name, object: object, userInfo: userInfo)
    }
    
    func removeObserver(observer: AnyObject) {
        defaultCenter.removeObserver(observer)
    }
    
    func removeObserver(observer: AnyObject, name: String?, object: AnyObject?) {
        defaultCenter.removeObserver(observer, name: name, object: object)
    }
    
    //MARK: Keyboard notifications
    
    func addKeyboardNotificationsObserver(observer: AnyObject, object: AnyObject?) {
        defaultCenter.addObserver(observer, selector: keyboardWillShowSelector, name: UIKeyboardWillShowNotification, object: object)
        defaultCenter.addObserver(observer, selector: keyboardWillHideSelector, name: UIKeyboardWillHideNotification, object: object)
    }
}
