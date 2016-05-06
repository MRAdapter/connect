//
//  GPRootController.swift
//  撩妹
//
//  Created by wxt on 16/5/4.
//  Copyright © 2016年 Adapter. All rights reserved.
//

import UIKit

class GPRootController: RESideMenu {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func awakeFromNib() {
        self.parallaxEnabled = false;
        self.scaleContentView = true;
        self.contentViewScaleValue = 0.95;
        self.scaleMenuView = false;
        self.contentViewShadowEnabled = true;
        self.contentViewShadowRadius = 4.5;
        
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GPMainTabController");
        self.leftMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GPLeftController");
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
