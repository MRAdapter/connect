//
//  GPCenterController.swift
//  撩妹
//
//  Created by wxt on 16/5/4.
//  Copyright © 2016年 Adapter. All rights reserved.
//

import UIKit

class GPCenterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
