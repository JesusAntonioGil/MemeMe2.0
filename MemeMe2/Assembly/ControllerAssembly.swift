//
//  ControllerAssembly.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import Typhoon


class ControllerAssembly: TyphoonAssembly {

    //Injected
    var helperAssembly: HelperAssembly!
    
    
    //MemeTableViewController
    internal dynamic func memeTableViewController() -> AnyObject {
        return TyphoonDefinition.withClass(MemeTableViewController.self) {
            (definition) in
                definition.injectProperty("presenter", with: self.memeTablePresenter())
        }
    }
    
    internal dynamic func memeTablePresenter() -> AnyObject {
        return TyphoonDefinition.withClass(MemeTablePresenter.self)
    }
    
    
}
