//
//  LDViewController.m
//  LDCountDownCircleExemple
//
//  Created by Damien Legrand on 28/04/2014.
//  Copyright (c) 2014 Damien Legrand. All rights reserved.
//

#import "LDViewController.h"
#import "LDCountDownCircle.h"
#import "LDTableViewCell.h"

@interface LDViewController ()
@end

@implementation LDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.tintColor = [UIColor brownColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    [cell.countDown startWithDuration:5.0 startAt:0.0];
    
    return cell;
}

@end
