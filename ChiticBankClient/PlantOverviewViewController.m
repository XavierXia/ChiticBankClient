//
//  PlantOverviewViewController.m
//  ChiticBankClient
//
//  Created by chitic on 13-4-25.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import "PlantOverviewViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PlantOverviewViewController ()

@end

@implementation PlantOverviewViewController

@synthesize topBKView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"电站概览" image:[UIImage imageNamed:@"Home"] tag:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    topBKView.layer.cornerRadius = 10;
    topBKView.layer.borderColor = [UIColor grayColor].CGColor;
    topBKView.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
