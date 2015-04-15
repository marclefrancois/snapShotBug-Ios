//
//  ViewController.m
//  SnapShotTest
//
//  Created by Marc Lefrancois on 2015-04-15.
//  Copyright (c) 2015 mirego. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNewSnapShot:(id)sender {
    self.label.text = @"new";
    if (self.snapshot) {
        [self.snapshot removeFromSuperview];
    }
    self.snapshot = (UIView *)[self.label snapshotViewAfterScreenUpdates:YES];
    NSLog(@"new snapshot: %@",[self.label snapshotViewAfterScreenUpdates:YES]);
    self.snapshot.frame = CGRectMake(self.view.frame.size.width - CGRectGetWidth(self.snapshot.frame) - 20, 100, CGRectGetWidth(self.snapshot.frame), CGRectGetHeight(self.snapshot.frame));
    [self.view addSubview:self.snapshot];
    self.label.text = @"label";
}

- (IBAction)newSnapNO:(id)sender {
    self.label.text = @"new";
    if (self.snapshot) {
        [self.snapshot removeFromSuperview];
    }
    self.snapshot = (UIView *)[self.label snapshotViewAfterScreenUpdates:NO];
    NSLog(@"new snapshot: %@",[self.label snapshotViewAfterScreenUpdates:NO]);
    self.snapshot.frame = CGRectMake(self.view.frame.size.width - CGRectGetWidth(self.snapshot.frame) - 20, 100, CGRectGetWidth(self.snapshot.frame), CGRectGetHeight(self.snapshot.frame));
    [self.view addSubview:self.snapshot];
    self.label.text = @"label";
}

- (IBAction)onOldSnapShot:(id)sender {
    self.label.text = @"old";
    if (self.snapshot) {
        [self.snapshot removeFromSuperview];
    }

    UIGraphicsBeginImageContextWithOptions(self.label.bounds.size, self.label.opaque, 0.0);
    [self.label.layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    UIImageView *snapshot = [[UIImageView alloc] init];
    snapshot.backgroundColor = [UIColor blackColor];
    snapshot.image = img;
    snapshot.frame = self.label.frame;
    NSLog(@"old snapshot: %@", snapshot);
    self.snapshot = snapshot;
    self.snapshot.frame = CGRectMake(20, 100, CGRectGetWidth(self.snapshot.frame), CGRectGetHeight(self.snapshot.frame));
    [self.view addSubview:self.snapshot];
    self.label.text = @"label";
}

@end
