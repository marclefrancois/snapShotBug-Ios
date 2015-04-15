//
//  ViewController.h
//  SnapShotTest
//
//  Created by Marc Lefrancois on 2015-04-15.
//  Copyright (c) 2015 mirego. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *oldBtn;
@property (weak, nonatomic) IBOutlet UIButton *snapShotBtn;
@property (nonatomic) UIView *snapshot;
@end

