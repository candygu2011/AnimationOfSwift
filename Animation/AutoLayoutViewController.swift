//
//  AutoLayoutViewController.swift
//  Animation
//
//  Created by hi on 15/10/12.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("%s",__FUNCTION__)
     
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("%s",__FUNCTION__)

    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("%s",__FUNCTION__)

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        println("%s",__FUNCTION__)
        let myButton = MyButton(count: 10, frame: CGRectMake(50, 100, 100, 30), color: nil)
        myButton.center.x = self.view.center.x
        myButton.animationType = MyButtonAnimationType.AnimationTypeScale
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 2
        self.view.addSubview(myButton)
    }
    override func loadView() {
        super.loadView()
        println("%s",__FUNCTION__)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
