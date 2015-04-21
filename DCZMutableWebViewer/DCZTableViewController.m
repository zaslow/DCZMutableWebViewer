//
//  MasterViewController.m
//  DCZMutableWebViewer
//
//  Created by Zaslow, Dean Clayton on 4/21/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZTableViewController.h"
#import "DCZURLViewController.h"
#import "DCZWebPage.h"
#import "DCZAddViewController.h"

@interface DCZTableViewController ()

@property NSMutableArray *webPages;

@end

@implementation DCZTableViewController

- (IBAction)addNewPage:(id)sender {
    DCZAddViewController *addPage = [[DCZAddViewController alloc] init];
    [addPage loadView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DCZWebPage *google = [[DCZWebPage alloc] init];
    google.pageName = @"Google";
    google.url = @"http://www.google.com";
    [_webPages addObject:google];
    
    self.urlContr = (DCZURLViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewPage:(id)sender {
    
    // Not done yet
    if (!self.webPages) {
        self.webPages = [[NSMutableArray alloc] init];
    }
    
    [self.webPages insertObject:[[DCZWebPage init] alloc] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DCZWebPage *webPage = self.webPages[indexPath.row];
        
        DCZURLViewController *urlContr = (DCZURLViewController *)[[segue destinationViewController] topViewController];
        [urlContr setWebPage:webPage];
        
        urlContr.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        urlContr.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.webPages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];

    DCZWebPage *webPage = self.webPages[indexPath.row];
    cell.textLabel.text = [webPage pageName];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.webPages removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
