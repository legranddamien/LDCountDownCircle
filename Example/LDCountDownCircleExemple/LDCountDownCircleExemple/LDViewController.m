//
//  LDViewController.m
//  LDCountDownCircleExemple
//
//  Created by Damien Legrand on 28/04/2014.
//  Copyright (c) 2014 Damien Legrand. All rights reserved.
//

#import "LDViewController.h"
#import "LDCountDownCircle.h"

@interface LDViewController ()
@property (weak, nonatomic) IBOutlet LDCountDownCircle *smallCountDown;
@property (weak, nonatomic) IBOutlet LDCountDownCircle *mediumCountDown;
@property (weak, nonatomic) IBOutlet LDCountDownCircle *largeCountDown;
@end

@implementation LDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _mediumCountDown.strokeWidth = 2.0;
    _largeCountDown.strokeWidth = 5.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIActions

- (IBAction)start:(id)sender
{
    [_smallCountDown startWithDuration:5.0 startAt:0.0];
    [_mediumCountDown startWithDuration:5.0 startAt:2.0];
    [_largeCountDown startWithDuration:5.0 startAt:3.0];
}

- (IBAction)stop:(id)sender
{
    [_smallCountDown stopCountDown];
    [_mediumCountDown stopCountDown];
    [_largeCountDown stopCountDown];
}


@end
