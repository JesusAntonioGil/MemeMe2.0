//
//  CameraHelperProtocol.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


@objc protocol CameraHelperProtocol {
    var delegate: CameraHelperDelegate? {get set}
    var viewController: UIViewController! {get set}
    
    func presentCamera(sourceType: UIImagePickerControllerSourceType)
    func checkCameraAvailable() -> Bool
}
