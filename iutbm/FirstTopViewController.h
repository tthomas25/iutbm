//
//  FirstTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"


@interface FirstTopViewController : UIViewController <UITabBarDelegate>
{
    NSArray *imagesArray;
    NSArray *labelArray;
}
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuItemsLabel;

@property (strong, nonatomic) IBOutlet UIImageView *anImageView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *aSegmentControl;
@property (strong, nonatomic) IBOutlet UILabel *label;

- (IBAction)didChangeSegmentControl:(UISegmentedControl*)sender;

- (IBAction)revealMenu:(id)sender;
- (void)activateTab:(int)index;

@end
