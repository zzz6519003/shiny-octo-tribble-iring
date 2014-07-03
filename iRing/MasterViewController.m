//
//  MasterViewController.m
//  iRing
//
//  Created by Snowmanzzz on 7/2/14.
//  Copyright (c) 2014 Snowmanzzz. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <FBShimmering.h>
#import <FBShimmeringView.h>

@interface MasterViewController () {
    NSMutableArray *_objects;
}

@property (strong, nonatomic) NSArray *fingleArray;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.fingleArray = @[@"大拇指", @"食指", @"中指", @"无名指", @"小拇指"];
    
//    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:shimmeringView];
//    
//    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
//    loadingLabel.textAlignment = NSTextAlignmentCenter;
//    loadingLabel.text = NSLocalizedString(@"Shimmer", nil);
//    shimmeringView.contentView = self.view;
//    
//    // Start shimmering.
//    shimmeringView.shimmering = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fingleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = 
    [UITableViewCell new];
    
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:cell.bounds];
    [self.view addSubview:shimmeringView];

    UILabel *label = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.fingleArray[indexPath.row];
    shimmeringView.contentView = label;

    // Start shimmering.
//    shimmeringView.shimmering = YES;
//    if (!shimmeringView.isShimmering) {
    shimmeringView.shimmering = NO;
        shimmeringView.shimmeringWithDelay = indexPath.row * 0.2;
//    }

//    cell.textLabel.text = self.fingleArray[indexPath.row];
    [cell addSubview:shimmeringView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
