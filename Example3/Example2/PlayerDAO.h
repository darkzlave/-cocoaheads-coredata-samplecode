//
//  PlayerDAO.h
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultDAO.h"
#import "Player.h"
@interface PlayerDAO : DefaultDAO
-(NSArray*) listEntities;
-(Player*) newPlayer;
@end
