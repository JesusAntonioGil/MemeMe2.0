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
                definition.injectProperty("storageHelperProtocol", with: self.helperAssembly.storageHelper())
                definition.injectProperty("controllerAssembly", with: self)
        }
    }
    
    //MemeCollectionViewController
    internal dynamic func memeCollectionViewController() -> AnyObject {
        return TyphoonDefinition.withClass(MemeCollectionViewController.self) {
            (definition) in
            definition.injectProperty("storageHelperProtocol", with: self.helperAssembly.storageHelper())
            definition.injectProperty("controllerAssembly", with: self)
        }
    }
    
    //GenerateViewController
    
    internal dynamic func generateNavigationController() -> AnyObject {
        return TyphoonDefinition.withFactory(self.storyboard("Main", factory: self), selector: "instantiateViewControllerWithIdentifier:", parameters: { (method) -> Void in
            method.injectParameterWith("GenerateNavigationController")
            }, configuration: nil)
    }
    
    internal dynamic func generateViewController() -> AnyObject {
        return TyphoonDefinition.withClass(GenerateViewController.self) {
            (definition) in
                definition.injectProperty("localNotificationHelperProtocol", with: self.helperAssembly.localNotificationHelper())
                definition.injectProperty("cameraHelperProtocol", with: self.helperAssembly.cameraHelper())
                definition.injectProperty("activityHelper", with: self.helperAssembly.activityHelper())
        }
    }
    
    //DetailViewController
    
    internal dynamic func detailViewController() -> AnyObject {
        return TyphoonDefinition.withFactory(self.storyboard("Main", factory: self), selector: "instantiateViewControllerWithIdentifier:", parameters: { (method) -> Void in
            method.injectParameterWith("DetailViewController")
            }, configuration: nil)
    }
    
    //MARK: Storyboards
    
    internal dynamic func storyboard(name: NSString, factory: TyphoonAssembly) -> AnyObject {
        return TyphoonDefinition.withClass(TyphoonStoryboard.self) {
            (definition) in
            definition.useInitializer("storyboardWithName:factory:bundle:") {
                (initializer) in
                initializer.injectParameterWith(name)
                initializer.injectParameterWith(factory)
                initializer.injectParameterWith(NSBundle.mainBundle())
            }
        }
    }
    
}
