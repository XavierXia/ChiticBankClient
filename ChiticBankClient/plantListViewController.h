//
//  plantListViewController.h
//  ChiticBankClient
//
//  Created by chitic on 13-4-22.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface plantListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate>{
    UIActivityIndicatorView *activity;
    ASIHTTPRequest *httpRequest;
}

-(void)requestPlantList;
-(void)requestFinished:(ASIHTTPRequest *)request;
-(void)requestFailed:(ASIHTTPRequest *)request;
@end
