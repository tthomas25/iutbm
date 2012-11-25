//
//  NewsViewController.m
//  iutbm
//
//  Created by projet2012 on 02/11/12.
//  Copyright (c) 2012 IOS_iut. All rights reserved.
//

#import "NewsViewController.h"
#import "MGScrollView.h"
#import "MGBox.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"


@implementation News

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) setupBox{
    
    
    
    MGScrollView *scroller = [MGScrollView scrollerWithSize:self.view.bounds.size];
    [self.view addSubview:scroller];
    
    MGTableBoxStyled *section = MGTableBoxStyled.box;
    [scroller.boxes addObject:section];
    
    
    // a default row size
    CGSize rowSize = (CGSize){304, 40};
    
    // a header row
    MGLineStyled *header = [MGLineStyled lineWithLeft:@"My First Table" right:nil size:rowSize];
    header.leftPadding = header.rightPadding = 16;
    [section.topLines addObject:header];
    
    // a string on the left and a horse on the right
    MGLineStyled *row1 = [MGLineStyled lineWithLeft:@"Left text"
                                              right:[UIImage imageNamed:@"slideshow_facebook.gif"] size:rowSize];
    [section.topLines addObject:row1];
    
    // a string with Mush markup
    MGLineStyled *row2 = MGLineStyled.line;
    row2.multilineLeft = @"This row has **bold** text, //italics// text, __underlined__ text, "
    "and some `monospaced` text. The text will span more than one line, and the row will "
    "automatically adjust its height to fit.|mush";
    row2.minHeight = 40;
    [section.topLines addObject:row2];
    
    [scroller layoutWithSpeed:0.3 completion:nil];
    [scroller scrollToView:section withMargin:8];
    scroller.topMargin = 200;
    
}


@end
