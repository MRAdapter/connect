//
//  AppDelegate.h
//  撩妹
//
//  Created by wxt on 16/3/16.
//  Copyright © 2016年 Adapter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/**
 *  coreData相关
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
/**
 *  调节夜晚和白天的颜色
 */
@property (nonatomic, assign) BOOL inNightMode;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

