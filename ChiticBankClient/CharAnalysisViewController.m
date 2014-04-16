//
//  CharAnalysisViewController.m
//  ChiticBankClient
//
//  Created by chitic on 13-5-15.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import "CharAnalysisViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CharAnalysisViewController ()

@end

@implementation CharAnalysisViewController
@synthesize baseView;
@synthesize dateBKView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    baseView.layer.cornerRadius = 10;
    baseView.layer.borderColor = [UIColor grayColor].CGColor;
    baseView.layer.borderWidth = 1;
    dateBKView.layer.cornerRadius = 7;
    dateBKView.layer.borderColor = [UIColor grayColor].CGColor;
    dateBKView.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
