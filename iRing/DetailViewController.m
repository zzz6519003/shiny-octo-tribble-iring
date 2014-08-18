//
//  DetailViewController.m
//  iRing
//
//  Created by Snowmanzzz on 7/2/14.
//  Copyright (c) 2014 Snowmanzzz. All rights reserved.
//

#import "DetailViewController.h"
#import <FBShimmeringView.h>
#import <POP.h>

@interface DetailViewController ()


- (void)configureView;

@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@property (strong, nonatomic) NSArray *fingerArray;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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

- (void)viewDidAppear:(BOOL)animated {
    // 1. Pick a Kind Of Animation //  POPBasicAnimation  POPSpringAnimation POPDecayAnimation
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    
    // 2. Decide weather you will animate a view property or layer property, Lets pick a View Property and pick kPOPViewFrame
    // View Properties - kPOPViewAlpha kPOPViewBackgroundColor kPOPViewBounds kPOPViewCenter kPOPViewFrame kPOPViewScaleXY kPOPViewSize
    // Layer Properties - kPOPLayerBackgroundColor kPOPLayerBounds kPOPLayerScaleXY kPOPLayerSize kPOPLayerOpacity kPOPLayerPosition kPOPLayerPositionX kPOPLayerPositionY kPOPLayerRotation kPOPLayerBackgroundColor
    basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    
    // 3. Figure Out which of 3 ways to set toValue
    //  anim.toValue = @(1.0);
    //  anim.toValue =  [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
    //  anim.toValue =  [NSValue valueWithCGSize:CGSizeMake(40, 40)];
    basicAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(110, 110, 90, 190)];
    
    // 4. Create Name For Animation & Set Delegate
    basicAnimation.name=@"AnyAnimationNameYouWant";
    basicAnimation.delegate=self;
    
    // 5. Add animation to View or Layer, we picked View so self.tableView and not layer which would have been self.tableView.layer
    [self.imageView pop_addAnimation:basicAnimation forKey:@"WhatEverNameYouWant"];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
    self.fingerArray = [NSArray arrayWithContentsOfFile:nil];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
