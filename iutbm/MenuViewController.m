//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuItemsLabel;
@property (nonatomic, strong) NSArray *menuItemsImage;
@end

@implementation MenuViewController
@synthesize menuItems;
@synthesize menuItemsImage;

- (void)awakeFromNib
{
    self.menuItems = [NSArray arrayWithObjects:@"First", @"Second", @"Third",@"Fourth",nil];
    self.menuItemsLabel = [NSArray arrayWithObjects:@"Accueil",@"Présentation",@"Formations",@"Lycéen", nil];
    self.menuItemsImage = [NSArray arrayWithObjects:@"house.png",@"presentation.png",@"book.png",@"user.png", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
     self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.menuItems.count;
    return self.menuItemsLabel.count;
    return self.menuItemsImage.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[menuItemsImage objectAtIndex:indexPath.row]];
    cell.textLabel.text = [self.menuItemsLabel objectAtIndex:indexPath.row];
    
    UIView *viewSelected = [[UIView alloc] init];
    viewSelected.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"BG-pattern2x.png"]];
    cell.selectedBackgroundView = viewSelected;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    NSString *identifier = [NSString stringWithFormat:@"%@Top", [self.menuItems objectAtIndex:indexPath.row]];
    
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}


@end
