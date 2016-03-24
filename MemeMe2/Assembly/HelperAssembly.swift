//
//  HelperAssembly.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import Typhoon


class HelperAssembly: TyphoonAssembly {

    //LocalNotificationHelper
    internal dynamic func localNotificationHelper() -> AnyObject {
        return TyphoonDefinition.withClass(LocalNotificationHelper.self) {
            (definition) in
                definition.injectProperty("defaultCenter", with: NSNotificationCenter.defaultCenter())
        }
    }
    
    //StorageHelper
    internal dynamic func storageHelper() -> AnyObject {
        return TyphoonDefinition.withClass(StorageHelper.self) {
            (definition) in
                definition.injectProperty("userDefaults", with: NSUserDefaults.standardUserDefaults())
        }
    }
    
    //CameraHelper
    internal dynamic func cameraManager() -> AnyObject {
        return TyphoonDefinition.withClass(CameraHelper.self)
    }
    
}
