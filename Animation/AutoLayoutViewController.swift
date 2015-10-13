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
    }
    override func loadView() {
        super.loadView()
        println("%s",__FUNCTION__)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
