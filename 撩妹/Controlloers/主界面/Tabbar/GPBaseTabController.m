//
//  GPBaseTabController.m
//  撩妹
//
//  Created by wxt on 16/3/31.
//  Copyright © 2016年 Adapter. All rights reserved.
//

#import "GPBaseTabController.h"
#import "UIColor+Util.h"
@interface GPBaseTabController ()
@property (nonatomic, assign) BOOL isPressed;
/** 中间视图 */
@property(nonatomic,strong)UIViewController*centerVC;
@end

@implementation GPBaseTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubControllor];
}

#pragma mark -- 私有方法
- (void)setUpSubControllor{
    //第一个控制器
    UINavigationController* nav1=[[UIStoryboard storyboardWithName:@"Message" bundle:nil] instantiateInitialViewController];
//    [self addChildViewController:nav1];
    UINavigationController* nav2=[[UIStoryboard storyboardWithName:@"Friends" bundle:nil] instantiateInitialViewController];
//    [self addChildViewController:nav2];
//    [self addChildViewController:[UIViewController new]];
    self.centerVC=[[UIStoryboard storyboardWithName:@"center" bundle:nil] instantiateInitialViewController];
    UINavigationController* nav3=[[UIStoryboard storyboardWithName:@"Find" bundle:nil] instantiateInitialViewController];
//    [self addChildViewController:nav3];
    UINavigationController* nav4=[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateInitialViewController];
//    [self addChildViewController:nav4];
    self.viewControllers = @[
                             nav1,
                             nav2,
                             [UIViewController new],
                             nav3,
                             nav4,
                             ];
    self.tabBar.translucent = NO;
    NSArray *titles = @[@"消息", @"好友", @"", @"发现", @"我"];
    NSArray *images = @[@"tabbar-news", @"tabbar-tweet", @"", @"tabbar-discover", @"tabbar-me"];
    NSLog(@"%@\n%@",self.tabBar.items,self.viewControllers);
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
        [item setImage:[UIImage imageNamed:images[idx]]];
        [item setSelectedImage:[[UIImage imageNamed:[images[idx] stringByAppendingString:@"-selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
    }];
    [self.tabBar setTintColor:[UIColor colorWithHex:0xF8E71C]];
    NSLog(@"%@\n%@",self.tabBar.items,self.viewControllers);
    [self.tabBar.items[2] setEnabled:NO];
    [self addCenterButtonWithImage:[UIImage imageNamed:@"tabbar-more"]];
}
/**
 *  添加中间的点击按钮
 */
- (void)addCenterButtonWithImage:(UIImage *)buttonImage
{
    _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGPoint origin = [self.view convertPoint:self.tabBar.center toView:self.tabBar];
    CGSize buttonSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 6, self.tabBar.frame.size.height - 4);
    
    _centerButton.frame = CGRectMake(origin.x - buttonSize.height/2, origin.y - buttonSize.height/2, buttonSize.height, buttonSize.height);
    //切圆
    _centerButton.layer.cornerRadius=_centerButton.bounds.size.width/2;
    _centerButton.layer.masksToBounds=YES;
    
    [_centerButton setBackgroundColor:[UIColor colorWithHex:0xF8E71C]];
    [_centerButton setImage:buttonImage forState:UIControlStateNormal];
    [_centerButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:_centerButton];
}
/**
 *  收放中间界面
 */
- (void)changeTheButtonStateAnimatedToOpen:(BOOL)isPressed
{
//    if (isPressed) {
        [self presentViewController:self.centerVC animated:YES completion:nil];
//    } else {
//        [self.centerVC dismissViewControllerAnimated:YES completion:nil];
//    }
}

#pragma mark  -- 按钮点击动作
/**
 *  中间按钮点击后的效果
 */
- (void)buttonPressed{
    [self changeTheButtonStateAnimatedToOpen:_isPressed];
    
    _isPressed = !_isPressed;
}

@end
