//
//  DetailViewController.h
//  Example1
//
//  Created by Phillipe Casorla on 3/1/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
