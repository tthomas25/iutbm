//
//  AppDelegate.h
//  iutbm
//
//  Created by projet2012 on 01/11/12.
//  Copyright (c) 2012 IOS_iut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

UIWindow *window;
UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;


@end
