//
//  FirstViewController.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "FirstViewController.h"
#import "FootballTeam.h"
#import "FootballTeamDAO.h"
#import "TeamPageViewController.h"

@interface FirstViewController ()
{
    NSArray *teams;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
	// Do any additional setup after loading the view, typically from a nib.
    FootballTeamDAO *footballDAO = [FootballTeamDAO buildDAO];
    teams = [footballDAO listEntities];
    [self.teamTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellTeam"];
    [self.teamTable reloadData];
}

- (void)insertNewObject:(id)sender
{
    FootballTeamDAO *footballDAO = [FootballTeamDAO buildDAO];
    [footballDAO newTeam];
    teams = [footballDAO listEntities];
    [self.teamTable reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return teams.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTeam"];
    FootballTeam * team = [teams objectAtIndex:indexPath.row];
    cell.textLabel.text = team.name;
    cell.detailTextLabel.text = team.country;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TeamPageViewController *page = [[TeamPageViewController alloc] init];
    page.team = [teams objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:page animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
