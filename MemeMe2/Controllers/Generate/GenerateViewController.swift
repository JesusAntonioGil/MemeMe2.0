//
//  GenerateViewController.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 25/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class GenerateViewController: UIViewController {

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var shareBottomConstraint: NSLayoutConstraint!
    
    //Inject
    var localNotificationHelperProtocol: LocalNotificationHelperProtocol!
    var cameraHelperProtocol: CameraHelperProtocol!
    var activityHelper: ActivityHelper!
    
    private var animateView: Bool = false
    
    
    
    //MARK: LIFE CYCLE
    
    override func typhoonDidInject() {
        cameraHelperProtocol.delegate = self
        cameraHelperProtocol.viewController = self
        activityHelper.viewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraButton.enabled = cameraHelperProtocol.checkCameraAvailable()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        localNotificationHelperProtocol.addKeyboardNotificationsObserver(self, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        localNotificationHelperProtocol.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: ACTIONS
    
    @IBAction func onDoneButtonTap(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCancelButtonTap(sender: AnyObject) {
        resetEditController()
    }
   
    @IBAction func onShareButtonTap(sender: AnyObject) {
        view.endEditing(true)
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, image: photoImageView.image!, memeImage: activityHelper.getImageFromView(shareView))
        activityHelper.shareImage(meme)
    }
    
    @IBAction func onCameraButtonTap(sender: AnyObject) {
        cameraHelperProtocol.presentCamera(.Camera)
    }
    
    @IBAction func onAlbumButtonTap(sender: AnyObject) {
        cameraHelperProtocol.presentCamera(.PhotoLibrary)
    }
    
    
    //MARK: NOTIFICATIONS
    
    func keyboardWillShow(notification: NSNotification) {
        if(animateView == true) {
            let userInfo = notification.userInfo!
            let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().height
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
            
            shareTopConstraint.constant = -keyboardHeight
            shareBottomConstraint.constant = keyboardHeight
            view.needsUpdateConstraints()
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if(animateView == true) {
            let userInfo = notification.userInfo!
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
            
            shareTopConstraint.constant = 0.0
            shareBottomConstraint.constant = 0.0
            view.needsUpdateConstraints()
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
        animateView = false
    }

    //MARK: PRIVATE
    
    private func resetEditController() {
        cancelButton.enabled = false
        shareButton.enabled = false
        photoImageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        view.endEditing(true)
    }
    
}


extension GenerateViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField == bottomTextField) {
            animateView = true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension GenerateViewController: CameraHelperDelegate {
    
    func cameraDidPhotoWithImage(image: UIImage, editingInfo: [String : AnyObject]?) {
        photoImageView.image = image
        cancelButton.enabled = true
        shareButton.enabled = true
    }
}
