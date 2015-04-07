//
//  ViewController.swift
//  HelloWorld
//
//  Created by yixiang.wang on 4/7/15.
//  Copyright (c) 2015 wangyixiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage(){
        let alterController = UIAlertController(title: "Welcome", message: "wangyixiang", preferredStyle: UIAlertControllerStyle.Alert)
        alterController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alterController, animated: true, completion: nil)
    }

}

