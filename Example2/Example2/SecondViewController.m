//
//  SecondViewController.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "SecondViewController.h"
#import "Player.h"
#import "PlayerDAO.h"

@interface SecondViewController ()
{
    NSArray *players;
}
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [self.playerTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellPlayer"];
    PlayerDAO *playerDAO = [PlayerDAO buildDAO];
    players = [playerDAO listEntities];
    [self.playerTable reloadData];    
}
- (void)insertNewObject:(id)sender
{
    PlayerDAO *playerDAO = [PlayerDAO buildDAO];
    [playerDAO newPlayer];
    players = [playerDAO listEntities];
    [self.playerTable reloadData];
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
