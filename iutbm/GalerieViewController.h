//
//  GalerieViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "MGScrollView.h"

@class MGScrollView, PhotoBox;

@interface GalerieViewController : UIViewController

@property (nonatomic, weak) IBOutlet MGScrollView *scroller;
@property (nonatomic, weak) IBOutlet UISegmentedControl *sender;

- (PhotoBox *)photoAddBox;
- (BOOL)allPhotosLoaded;
- (IBAction)revealMenu:(id)sender;
- (IBAction)segmentSwitch:(id)sender;
- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;

@end

