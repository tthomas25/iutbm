//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FirstTopViewController.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"


#define ROW_SIZE               (CGSize){304, 44}
#define ROW_SIZE_LANDSCAPE     (CGSize){480,44}


#define IPHONE_PORTRAIT_GRID   (CGSize){312, 0}
#define IPHONE_LANDSCAPE_GRID  (CGSize){160, 0}
#define IPHONE_TABLES_GRID     (CGSize){320, 0}


#define IPAD_PORTRAIT_GRID     (CGSize){136, 0}
#define IPAD_LANDSCAPE_GRID    (CGSize){390, 0}
#define IPAD_TABLES_GRID       (CGSize){624, 0}

#define HEADER_FONT            [UIFont fontWithName:@"HelveticaNeue" size:14]

@implementation FirstTopViewController{
    MGBox *tablesGrid, *table1, *table2;
    UIImage *arrow;
    BOOL phone;
}

@synthesize menuItems;
@synthesize menuItemsLabel;

@synthesize anImageView;
@synthesize label;

- (void)setupData {
    imagesArray = [NSArray arrayWithObjects:@"slideshows_bouge.png",@"slideshow_facebook.png",@"slideshow_formations.png",@"slideshow_adiut.png", nil];
    labelArray = [NSArray arrayWithObjects:@"L'actualité des formations et de la vie étudiante", @"Rejoignez-nous! Dites-nous 'J'aime' sur www.facebook.com/mont.bel.iut et vous saurez tout sur la vie à l'IUT Belfort-Montbéliard !",@"Brochure des formations 2012-2013",@"115 IUT en France", nil];
   
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)o {
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
   
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft
        ||  toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        
        
    }
    else
    {
        
            }
    
    [self.scroller layoutWithSpeed:duration completion:nil];
}
    

- (void)loadIntroSection{
    NSUInteger i=0;
    for(i=0;i<imagesArray.count;i++)
    {
        
        // intro section
        MGTableBoxStyled *menu = MGTableBoxStyled.box;
        [table1.boxes addObject:menu];
    
        // header line
        MGLineStyled
        *header = [MGLineStyled lineWithLeft:[labelArray objectAtIndex:i] right:nil size:ROW_SIZE];
        header.font = HEADER_FONT;
        [menu.topLines addObject:header];
    
        // layout menu line
        MGLine *line1 = [MGLine lineWithLeft:[UIImage imageNamed:[imagesArray objectAtIndex:i]] multilineRight:@"" width:304 minHeight:40];
        [menu.topLines addObject:line1];
        
        
    }
    
}


@end