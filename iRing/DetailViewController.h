//
//  DetailViewController.h
//  iRing
//
//  Created by Snowmanzzz on 7/2/14.
//  Copyright (c) 2014 Snowmanzzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (assign, nonatomic) NSInteger whichFinger;

@end
