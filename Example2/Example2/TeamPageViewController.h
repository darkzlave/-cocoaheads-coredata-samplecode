//
//  TeamPageViewController.h
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FootballTeamDAO.h"
#import "Player.h"
#import "FootballTeam.h"

@interface TeamPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *teamName;
@property (weak, nonatomic) IBOutlet UILabel *teamCountry;

@property (weak, nonatomic) IBOutlet UITableView *tablePlayers;

@property (weak, nonatomic) IBOutlet UILabel *otherCountries;
@property (strong,nonatomic) FootballTeam *team;
@end
