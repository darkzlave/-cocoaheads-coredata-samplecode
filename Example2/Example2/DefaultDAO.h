//
//  DefaultDAO.h
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreManager.h"

@interface DefaultDAO : NSObject
+(id) buildDAO;
-(void) save;
-(NSArray*) listEntities:(NSString*)entityName;
@end
