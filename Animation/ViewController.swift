//
//  ViewController.swift
//  Animation
//
//  Created by hi on 15/10/12.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var sunImageView: UIImageView!
    
    @IBOutlet weak var cloudImageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.userName.center.x += self.view.bounds.width
//            self.password.center.x += self.view.bounds.width
        })
        UIView.animateWithDuration(0.5, delay:0.3, options: .CurveEaseOut, animations: { () -> Void in
            self.password.center.x += self.view.bounds.width

        }, completion: nil)
     
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let rotation = CGAffineTransformMakeRotation(CGFloat( M_PI))
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.sunImageView.transform = rotation

        }, completion: nil)
        
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.cloudImageView.transform = CGAffineTransformMakeScale(0.6, 0.6)
            }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        

    }
    
    func keyboardWillShow(notification:NSNotification){
        let dict = NSDictionary(dictionary: notification.userInfo!)
        let keyboardFrame = dict[UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
        let duration = dict[UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardFrame.size.height)
        })
        
        println(keyboardFrame.size.height)
    }
    
    func keyboardWillHide(notification:NSNotification){
        let dict = NSDictionary(dictionary: notification.userInfo!)
        let duration = dict[UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.view.transform = CGAffineTransformIdentity
        })
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
 
  

}

