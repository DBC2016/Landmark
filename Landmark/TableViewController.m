//
//  TableViewController.m
//  Landmark
//
//  Created by Demond Childers on 5/3/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

#import "TableViewController.h"
#import "Landmark.h"
#import "AppDelegate.h"
//#import "DetailViewController.h"


@interface TableViewController ()


@property (nonatomic, weak) IBOutlet    UITableView            *landmarkTableView;
@property (nonatomic, strong)           AppDelegate             *appDelegate;
@property (nonatomic, strong)           NSManagedObjectContext  *managedObjectContext;

@end

@implementation TableViewController



#pragma mark - Table View Methods

//ENTER DATA INTO TABLE VIEW CELLS & INDEX PATH FOR ROWS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _appDelegate.landmarkArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        Landmark *currentLandmark = _appDelegate.landmarkArray[indexPath.row];
        cell.textLabel.text = currentLandmark.landName;
        cell.detailTextLabel.text = currentLandmark.landAddress;
    return cell;
}


        
#pragma - Life Cycle Methods


- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = [[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    _appDelegate.landmarkArray = [_appDelegate fetchItems];
    NSLog(@"total records %li",_appDelegate.landmarkArray.count);
    [_landmarkTableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
