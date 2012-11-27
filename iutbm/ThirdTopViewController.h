//
//  ThirdTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"


@interface ThirdTopViewController : UIViewController
{
    NSArray *imagesArray;
    NSArray *labelArray;
}

@property (nonatomic, strong) NSArray *DUTItems;
@property (nonatomic, strong) NSArray *LicenceItems;

- (IBAction)revealMenu:(id)sender;
@end
