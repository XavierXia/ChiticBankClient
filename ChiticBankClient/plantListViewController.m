//
//  plantListViewController.m
//  ChiticBankClient
//
//  Created by chitic on 13-4-22.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import "plantListViewController.h"
#import "SimplePlantTableViewCell.h"
#import "PlantOverviewViewController.h"
#import "CharAnalysisViewController.h"
#import "EnviroDataViewController.h"
#import "SavingDataViewController.h"
#import "DeviceDataViewController.h"
#import "ASIHTTPRequest.h"

@interface plantListViewController ()

@end

@implementation plantListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self requestPlantList];
    // Do any additional setup after loading the view from its nib.
}

-(void)requestPlantList
{
    NSURL *url = [NSURL URLWithString:@"http://60.12.137.82/api/chitic/appPlantsList?Username=demo&MaxSize=10&FindPage=1"];
    //异步请求
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        // Use when fetching textdata        
        NSString *responseString = [request responseString];
        NSLog(@"%@",responseString);
        // Use when fetching binarydata
//        NSData *responseData = [request responseData];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        NSLog(@"error:%@",[error userInfo]);
    }];    
    [request startAsynchronous];
    /*    //开始同步请求
//构造ASIHTTPRequest对象
     
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    assert(!error); //给出断言
    //若请求成功，返回response数据
    NSString *response = [request responseString];
    const char* c = [response cStringUsingEncoding:NSISOLatin1StringEncoding];
    NSString *str = [[NSString alloc] initWithCString:c encoding:NSUTF8StringEncoding];
    NSLog(@"response:%@",str);
//    NSData *data = [request responseData];
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
*/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.dataList count];
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CustomCellIdentifier = @"SimplePlantTableViewCellIdentifier";
    
    //加速频繁使用的NIB文件的加载
    static BOOL nibsRegistered = NO;
    //if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"SimplePlantTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    //}
    
    SimplePlantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell == nil) {
        cell = [[SimplePlantTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CustomCellIdentifier];
    }
    
    
    //NSUInteger row = [indexPath row];
    //NSDictionary *rowData = [self.dataList objectAtIndex:row];
    
    //cell.name = [rowData objectForKey:@"name"];
    //cell.dec = [rowData objectForKey:@"dec"];
    //cell.loc = [rowData objectForKey:@"loc"];
    //cell.image = [imageList objectAtIndex:row];
    //[cell setDailyEnergyValue:@"55.7"];
    
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}



- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    PlantOverviewViewController * OverviewViewController = [[PlantOverviewViewController alloc] initWithNibName:@"PlantOverviewViewController" bundle:nil];
    [OverviewViewController setTitle:@"电站概览"];
    [OverviewViewController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Home.png"]
     withFinishedUnselectedImage:[UIImage imageNamed:@"Home.png"]];
    
    CharAnalysisViewController * chartViewController = [[CharAnalysisViewController alloc] initWithNibName:@"CharAnalysisViewController" bundle:nil];
    [chartViewController setTitle:@"图表分析"];
    [chartViewController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"StatAnalysis.png"]
    withFinishedUnselectedImage:[UIImage imageNamed:@"StatAnalysis.png"]];
    
    EnviroDataViewController * enviroViewController = [[EnviroDataViewController alloc] initWithNibName:@"EnviroDataViewController" bundle:nil];
    [enviroViewController setTitle:@"气象环境"];
    [enviroViewController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Enviro.png"]
                                 withFinishedUnselectedImage:[UIImage imageNamed:@"Enviro.png"]];
    
    SavingDataViewController * savingViewController = [[SavingDataViewController alloc] initWithNibName:@"SavingDataViewController" bundle:nil];
    [savingViewController setTitle:@"节能减排"];
    [savingViewController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Saving.png"]
                                  withFinishedUnselectedImage:[UIImage imageNamed:@"Saving.png"]];
    
    DeviceDataViewController * devDataViewController = [[DeviceDataViewController alloc] initWithNibName:@"DeviceDataViewController" bundle:nil];
    [devDataViewController setTitle:@"设备数据"];
    [devDataViewController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"dev_data.png"]
                                  withFinishedUnselectedImage:[UIImage imageNamed:@"dev_data.png"]];

    UITabBarController * TabBarContoller = [[UITabBarController alloc] init];
    [TabBarContoller setTitle:@"浙江正泰太阳能510kWp光伏发电项目"];
   
    TabBarContoller.viewControllers = [NSArray arrayWithObjects:OverviewViewController,chartViewController,devDataViewController,enviroViewController,savingViewController,nil];
    
    TabBarContoller.selectedIndex = 0;
    
    [self.navigationController pushViewController:TabBarContoller animated:YES];
}

@end
