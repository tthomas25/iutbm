//
//  ThirdTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "ThirdTopViewController.h"

@implementation ThirdTopViewController

@synthesize DUTItems;
@synthesize LicenceItems;

typedef enum { SectionHeader, SectionMiddle, SectionDetail } Sections;

- (void)setupData {
    imagesArray = [NSArray arrayWithObjects:@"slideshows_bouge.gif",@"slideshow_facebook.gif",@"slideshow_formations.gif",@"slideshow_adiut.gif", nil];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
    [super viewDidLoad];
    [self setupData];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BG-pattern2x.png"]]];
}

- (void)awakeFromNib
{
    self.DUTItems = [NSArray arrayWithObjects:@"Carrières Sociales", @"Génie Civil", @"Génie Electrique et Information Industrielle",@"Génie Thermique et Energie",@"Informatique",@"Technique de Commercialisation",@"Gestion Administrative et Commerciale",@"Mesures Physiques",@"Réseaux & télécommunications",@"Services & Réseaux de Communication", nil];
    self.LicenceItems = [NSArray arrayWithObjects:@"Animation Sociale et Socio-culturelle", @"Conduite de Travaux et Performance Energétique des Bâtiments", @"Enérgie Renouvelables",@"Famille,vieillissement et Problématique Intergénérationnelles",@"Gestion de Projets d'Innovation",@"Véhicules: Eléctronique et Gestion des Automatismes",@"TIC Appliquées au Marketing et au Commerce",@"Technologies de Projets Web et Mobiles",@"Attaché au Développement International des Organisations",@"Capteurs,Instrumentation,Métrologie",@"Chargé d'Affaires en Réseaux et Télécommunications",@"Dosimétrie et Radioprotection Médicales",@"Marketing opérationnel du Spectacle, de l'Evénement et des loisirs",@"Webdesign", nil];
    
    
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (section) {
        case 0: return self.DUTItems.count;
        case 1: return self.LicenceItems.count;
        default: return 0;
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"ItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BG-pattern2x.png"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section==0)
    {
        cell.textLabel.text = [self.DUTItems objectAtIndex:indexPath.row];
    }
    else if(indexPath.section==1)
    {
        cell.textLabel.text = [self.LicenceItems objectAtIndex:indexPath.row];
    }
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // create the parent view that will hold header Label
	UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
	// create the button object
	UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	headerLabel.backgroundColor = [UIColor clearColor];
	headerLabel.opaque = NO;
	headerLabel.textColor = [UIColor blackColor];
	headerLabel.highlightedTextColor = [UIColor whiteColor];
	headerLabel.font = [UIFont boldSystemFontOfSize:20];
	headerLabel.frame = CGRectMake(30.0, 0.0, 300.0, 44.0);
  
    if(section == 0){
    
        headerLabel.text = @"DUT"; 
        [customView addSubview:headerLabel];
    
    }
    else if(section == 1){
     
        headerLabel.text = @"Licence"; 
        [customView addSubview:headerLabel];
        
    }
    return customView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 40;
}


@end
