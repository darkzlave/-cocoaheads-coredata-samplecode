//
//  Player.h
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultEntity.h"

@class FootballTeam;

@interface Player : DefaultEntity

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int64_t skill;
@property (nonatomic, retain) FootballTeam *team;

@end
