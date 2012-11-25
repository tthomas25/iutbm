//
//  SecondTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "SecondTopViewController.h"

@implementation SecondTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    self.slidingViewController.anchorLeftPeekAmount     = 0;
    self.slidingViewController.anchorLeftRevealAmount   = 0;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupText];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BG-pattern2x.png"]]];
    }

-(BOOL)shouldAutorotate{
    return YES;
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft
        ||  toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        
        CGRect labelFrame = CGRectMake( 10, 40, 300, 30 );
        UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
        [label setText: @"My Label"];
        [label setTextColor: [UIColor orangeColor]];
        [self.view addSubview: label];
    }
    else
    {
        CGRect labelFrame = CGRectMake( 10, 40, 300, 30 );
        UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
        [label setText: @"My other Label"];
        [label setTextColor: [UIColor orangeColor]];
        [self.view addSubview: label];
    }
}
-(void)setupText{
/*
    CGRect labelFrame = CGRectMake(15, -65, 280, 400);
    UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
    [label setText: @"L’IUT de Belfort-Montbéliard, établissement public d’enseignement supérieur, est une composante de l’Université de Franche-Comté.Les diplômes préparés à l’IUT de Belfort-Montbéliard s’inscrivent dans l’espace européen de l’enseignement supérieur et le schéma LMD (Licence - Master - Doctorat)."];
    label.font = [UIFont systemFontOfSize:14];
    [label setBackgroundColor: [UIColor clearColor]];
    //[label setTextColor: [UIColor colorWithRed:0.57647 green:0.07059 blue:0.32157 alpha:1]];
    label.numberOfLines = 8 ;
    label.lineBreakMode=NSLineBreakByCharWrapping;
    [self.view addSubview: label];

    CGRect labelFrame1 = CGRectMake(15, 200, 280, 30);
    UILabel* labeltitre = [[UILabel alloc] initWithFrame: labelFrame1];
    [labeltitre setText: @"Plus de 40 d'expérience"];
    labeltitre.font = [UIFont systemFontOfSize:16];
    [labeltitre setBackgroundColor: [UIColor clearColor]];
    [labeltitre setTextColor: [UIColor colorWithRed:0.57647 green:0.07059 blue:0.32157 alpha:1]];
    [self.view addSubview: labeltitre];
    
    CGRect labelFrame2 = CGRectMake(15, 150, 280, 400);
    UILabel* label2 = [[UILabel alloc] initWithFrame: labelFrame2];
    [label2 setText: @"L’IUT de Belfort-Montbéliard prépare les étudiants aux fonctions d’encadrement technique dans la conception, la production, la recherche appliquée et dans le secteur tertiaire.L'établissement forme des collaborateurs d’ingénieurs ou de cadres supérieurs techniques, administratifs, financiers ou commerciaux avec une double exigence : formation théorique et pratique professionnelle."];
    label2.font = [UIFont systemFontOfSize:14];
    label2.numberOfLines = 8 ;
    [label2 setBackgroundColor: [UIColor clearColor]];
    
    [self.view addSubview: label2];*/
    
    // alocate and initialize scroll
    UIScrollView *myScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 370.0f)];
   
    // alocate and initialize label
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 370.0f)];

    // add long text to label
    myLabel.text = @"L’IUT de Belfort-Montbéliard, établissement public d’enseignement supérieur, est une composante de l’Université de Franche-Comté.Les diplômes préparés à l’IUT de Belfort-Montbéliard s’inscrivent dans l’espace européen de l’enseignement supérieur et le schéma LMD (Licence - Master - Doctorat).Plus de 40 ans d'expérience.L’IUT de Belfort-Montbéliard prépare les étudiants aux fonctions d’encadrement technique dans la conception, la production, la recherche appliquée et dans le secteur tertiaire.L'établissement forme des collaborateurs d’ingénieurs ou de cadres supérieurs techniques, administratifs, financiers ou commerciaux avec une double exigence : formation théorique et pratique professionnelle.De bac+2 à bac+3,des formations adaptées à la professionnalisationEntrer en formation à l’IUT de Belfort-Montbéliard, c’est se donner les moyens d’assurer son développement personnel et professionnel.Il s’agit bien d’être opérationnel mais aussi de se donner les moyens de pouvoir évoluer tout au long de la vie. Grâce à un mode d’enseignement varié, théorique et pratique, chaque futur diplômé se prépare un avenir en phase avec la réalité du monde économique.IUT de France, la force d’un réseauLes 115 IUT répartis sur l’ensemble du territoire, sont regroupés au sein d’un réseau, garantissant ainsi une cohérence nationale. Avec plus de 200 lieux de formation, les IUT offrent un maillage territorial dense et travaillent en étroite collaboration avec le bassin d’emploi local, au travers des projets tuteurés et des tranfers de technologies.Depuis leur création, les IUT ont formé plus d’1 million de diplômé et déjà plus de 3 000 diplômés de licence professionnelle. L’offre de formation couvre tous les champs d’activité des domaines secondaire et tertiaire, soit 26 spécialités.";
    // set line break mode to word wrap
    myLabel.lineBreakMode = NSLineBreakByWordWrapping;
    // set number of lines to zero
    myLabel.numberOfLines = 0;
    // resize label
    [myLabel sizeToFit];
    
    // set scroll view size
    myScroll.contentSize = CGSizeMake(myScroll.contentSize.width, myLabel.frame.size.height);
    [myScroll setBackgroundColor:[UIColor clearColor]];
     [myLabel setBackgroundColor:[UIColor clearColor]];
    // add myLabel
    [myScroll addSubview:myLabel];
    // add scroll view to main view
    [self.view addSubview:myScroll];
   
}

@end