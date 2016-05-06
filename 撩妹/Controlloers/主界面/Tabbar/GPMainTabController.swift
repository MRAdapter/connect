//
//  GPMainTabController.swift
//  撩妹
//
//  Created by wxt on 16/5/4.
//  Copyright © 2016年 Adapter. All rights reserved.
//

import UIKit

class GPMainTabController: UITabBarController {
    
    var isPressed:Bool = false
    /** 中间视图 */
    var centerVC:UIViewController? = UIViewController()
    
    var centerButton  =  UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubControllor()
    }
    
    //MARK: 私有方法
    /**
     设置子控件
     */
    func setUpSubControllor() -> Void {
        //第一个控制器
        let nav1 = UIStoryboard.init(name: "Message", bundle: nil).instantiateInitialViewController()
        let nav2 = UIStoryboard.init(name: "Friends", bundle: nil).instantiateInitialViewController()
        self.centerVC=UIStoryboard.init(name: "center", bundle: nil).instantiateInitialViewController()
        let nav3 = UIStoryboard.init(name: "Find", bundle: nil).instantiateInitialViewController();
        let nav4 = UIStoryboard.init(name: "Mine", bundle: nil).instantiateInitialViewController();
        self.viewControllers = [
            nav1!,
            nav2!,
            UIViewController(),
            nav3!,
            nav4!,
        ];
        self.tabBar.translucent = false;
        var titles = ["消息", "好友", "", "发现", "我"]
        var images = ["tabbar-news", "tabbar-tweet", "", "tabbar-discover", "tabbar-me"]
        for item in self.tabBar.items! {
            let index = self.tabBar.items?.indexOf(item)
            item.title=titles[index!];
            item.image=UIImage.init(named: images[index!])
            item.selectedImage=UIImage.init(named: images[index!].stringByAppendingString("-selected"))
        }
        self.tabBar.tintColor=UIColor.init(hex: 0xF8E71C);
        self.tabBar.items?[2].enabled=true
        self.addCenterButtonWithImage(UIImage.init(named: "tabbar-more")!)
    }
    
    /**
     添加中间的按钮
     
     - parameter image: 图片名称
     */
    func addCenterButtonWithImage(image : UIImage) -> Void {
        centerButton = UIButton.init(type: UIButtonType.Custom);
        
        let origin = self.view.convertPoint(self.tabBar.center, toView: self.tabBar);
        let buttonSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 6, self.tabBar.frame.size.height - 4);
        
        centerButton.frame = CGRectMake(origin.x - buttonSize.height/2, origin.y - buttonSize.height/2, buttonSize.height, buttonSize.height);
        //切圆
        centerButton.layer.cornerRadius=centerButton.bounds.size.width/2;
        centerButton.layer.masksToBounds=true;
        centerButton.backgroundColor=UIColor.init(hex: 0xF8E71C)
        centerButton.setImage(image , forState: UIControlState.Normal)
        centerButton.addTarget(self, action: #selector(self.buttonPressed), forControlEvents: UIControlEvents.TouchUpInside);
        self.tabBar.addSubview(centerButton);
    }
    /**
     中间按钮的点击动作
     */
    func buttonPressed() -> Void {
        self.changeTheButtonStateAnimatedToOpen(isPressed);
        isPressed = !isPressed;
    }
    /**
     弹出中间的视图
     
     - parameter isPress: 按钮的选中状态
     */
    func changeTheButtonStateAnimatedToOpen(isPress:Bool) -> Void {
        self.presentViewController(self.centerVC!, animated: true,  completion: nil)
    }

}
