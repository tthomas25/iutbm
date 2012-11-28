//
//  NewsViewController.m
//  iutbm
//
//  Created by projet2012 on 02/11/12.
//  Copyright (c) 2012 IOS_iut. All rights reserved.
//

#import "NewsViewController.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"

#define TOTAL_IMAGES           28
#define IPHONE_INITIAL_IMAGES  3
#define IPAD_INITIAL_IMAGES    11

#define ROW_SIZE               (CGSize){304, 44}


#define IPHONE_PORTRAIT_GRID   (CGSize){312, 0}
#define IPHONE_LANDSCAPE_GRID  (CGSize){160, 0}
#define IPHONE_TABLES_GRID     (CGSize){320, 0}


#define IPAD_PORTRAIT_GRID     (CGSize){136, 0}
#define IPAD_LANDSCAPE_GRID    (CGSize){390, 0}
#define IPAD_TABLES_GRID       (CGSize){624, 0}

#define HEADER_FONT            [UIFont fontWithName:@"HelveticaNeue" size:18]

@implementation News {
    MGBox *tablesGrid, *table1, *table2;
    UIImage *arrow;
    BOOL phone;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // iPhone or iPad?
    UIDevice *device = UIDevice.currentDevice;
    phone = device.userInterfaceIdiom == UIUserInterfaceIdiomPhone;
    
    // i'll be using this a lot
    arrow = [UIImage imageNamed:@"arrow"];
    
    // setup the main scroller (using a grid layout)
    self.scroller.contentLayoutMode = MGLayoutGridStyle;
    self.scroller.bottomPadding = 8;
    
    
    // the tables grid
    CGSize tablesGridSize = phone ? IPHONE_TABLES_GRID : IPAD_TABLES_GRID;
    tablesGrid = [MGBox boxWithSize:tablesGridSize];
    tablesGrid.contentLayoutMode = MGLayoutGridStyle;
    [self.scroller.boxes addObject:tablesGrid];
    
    // the features table
    table1 = MGBox.box;
    [tablesGrid.boxes addObject:table1];
    table1.sizingMode = MGResizingShrinkWrap;
    
    // the subsections table
    table2 = MGBox.box;
    [tablesGrid.boxes addObject:table2];
    table2.sizingMode = MGResizingShrinkWrap;
    
    
    
    [self loadIntroSection];
    
    [tablesGrid layout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation
                                           duration:1];
    [self didRotateFromInterfaceOrientation:UIInterfaceOrientationPortrait];
}

#pragma mark - Rotation and resizing

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)o {
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orient
                                         duration:(NSTimeInterval)duration {
    
    BOOL portrait = UIInterfaceOrientationIsPortrait(orient);
    
    // relayout the sections
    [self.scroller layoutWithSpeed:duration completion:nil];
}

#pragma mark - Main menu sections

- (void)loadIntroSection {
    
    // intro section
    MGTableBoxStyled *menu = MGTableBoxStyled.box;
    [table1.boxes addObject:menu];
    
    // header line
    MGLineStyled
    *header = [MGLineStyled lineWithLeft:@"MGBox Demo" right:nil size:ROW_SIZE];
    header.font = HEADER_FONT;
    [menu.topLines addObject:header];
    
    // layout menu line
    MGLineStyled
    *layoutLine = [MGLineStyled lineWithLeft:@"Layout Features" right:arrow
                                        size:ROW_SIZE];
    [menu.topLines addObject:layoutLine];
    
    /*// load the features table on tap
     layoutLine.onTap = ^{
     [self loadLayoutFeaturesSection:YES];
     };*/
    
    // convenience features menu line
    MGLineStyled
    *conviniLine = [MGLineStyled lineWithLeft:@"Code Convenience Features"
                                        right:arrow size:ROW_SIZE];
    [menu.topLines addObject:conviniLine];
    
    /*// load the features table on tap
     conviniLine.onTap = ^{
     [self loadConviniFeaturesSection:YES];
     };*/
}


@end
