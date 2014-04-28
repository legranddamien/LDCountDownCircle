//
//  LDTableViewCell.h
//  LDCountDownCircleExemple
//
//  Created by Damien Legrand on 28/04/2014.
//  Copyright (c) 2014 Damien Legrand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDCountDownCircle.h"

@interface LDTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LDCountDownCircle *countDown;

@end
