//
//  TeamPageViewController.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "TeamPageViewController.h"
#import "TeamPageViewController.h"
@interface TeamPageViewController ()
{
    NSArray *players;
}
@end

@implementation TeamPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    players = [self.team.players allObjects];
    self.teamName.text = self.team.name;
    self.teamCountry.text = self.team.country;
    FootballTeamDAO *teamDAO = [FootballTeamDAO buildDAO];
    NSArray *teams = [teamDAO teamsPerCountry:self.team.country];
    self.otherCountries.text = [@"" stringByAppendingFormat:@"There are %i teams with players from %@",teams.count,self.team.country];
    // Do any additional setup after loading the view from its nib.
    [self.tablePlayers registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellPlayer"];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return players.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellPlayer"];
    Player * player= [players objectAtIndex:indexPath.row];
    cell.textLabel.text = player.name;
    cell.detailTextLabel.text = [@"Skill: " stringByAppendingFormat:@"%lli",player.skill];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
