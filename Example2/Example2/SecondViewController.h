//
//  SecondViewController.h
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *playerTable;

@end
