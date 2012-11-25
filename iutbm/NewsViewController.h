//
//  NewsViewController.h
//  iutbm
//
//  Created by projet2012 on 02/11/12.
//  Copyright (c) 2012 IOS_iut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "MGScrollView.h"

@interface News : UIViewController 

@property (nonatomic, weak) IBOutlet MGScrollView *scroller;

@end
