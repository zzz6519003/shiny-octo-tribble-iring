//
//  DetailViewController.m
//  iRing
//
//  Created by Snowmanzzz on 7/2/14.
//  Copyright (c) 2014 Snowmanzzz. All rights reserved.
//

#import "DetailViewController.h"
#import <FBShimmeringView.h>

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {

    }
    
    self.detailDescriptionLabel.text = [self.detailItem description];
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.navigationController.view.bounds];
    [self.view addSubview:shimmeringView];
    
    shimmeringView.contentView = self.detailTextView;
    
    // Start shimmering.
    shimmeringView.shimmering = YES;

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
