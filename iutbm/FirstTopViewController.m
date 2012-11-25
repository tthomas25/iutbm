//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FirstTopViewController.h"



@implementation FirstTopViewController

@synthesize menuItems;
@synthesize menuItemsLabel;

@synthesize anImageView;
@synthesize label;

- (void)setupData {
    imagesArray = [NSArray arrayWithObjects:@"slideshows_bouge.gif",@"slideshow_facebook.gif",@"slideshow_formations.gif",@"slideshow_adiut.gif", nil];
    labelArray = [NSArray arrayWithObjects:@"L'actualité des formations et de la vie étudiante", @"Rejoignez-nous!",@"Brochure des formations 2012-2013",@"115 IUT en France", nil];
   
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}


- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)viewDidLoad {
    [self setupUI];
    [self setupData];
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BG-pattern2x.png"]]];
   
}

- (void)awakeFromNib
{
    self.menuItems = [NSArray arrayWithObjects:@"Nouveautés rentrée", @"La nuit des IUT", @"Journée portes ouvertes", nil];
    self.menuItemsLabel = [NSArray arrayWithObjects:@"(PDF 247 Ko)", @"(PDF 237 Ko)", @"(PDF 143 Ko)", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.menuItems.count;
    return self.menuItemsLabel.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"ItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BG-pattern2x.png"]];
    tableView.opaque = NO;
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.menuItemsLabel objectAtIndex:indexPath.row];
    return cell;
}

-(void)setupUI{
    
    [anImageView.layer setBorderWidth:5.0f];
    [anImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [anImageView.layer setShadowRadius:5.0f];
    [anImageView.layer setShadowOpacity:.85f];
    [anImageView.layer setShadowOffset:CGSizeMake(1.0f, 2.0f)];
    [anImageView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [anImageView.layer setShouldRasterize:YES];
    [anImageView.layer setMasksToBounds:NO];
    /*anImageView.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"slideshows_bouge.gif"],
                                   [UIImage imageNamed:@"slideshow_facebook.gif"],
                                   [UIImage imageNamed:@"slideshow_formations.gif"],
                                   [UIImage imageNamed:@"slideshow_adiut.gif"],nil];
    anImageView.animationDuration = 10;
    anImageView.animationRepeatCount = 0;
    [anImageView startAnimating];*/
    
    
}

- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        
    }
    else
    {
        
    }
}



@end