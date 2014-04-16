//
//  chiticeaViewController.m
//  ChiticBankClient
//
//  Created by chitic on 13-4-22.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import "chiticeaViewController.h"
#import "plantListViewController.h"
#import "AboutUsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIGlossyButton.h"
#import <CommonCrypto/CommonDigest.h>
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@interface chiticeaViewController ()

@end

@implementation chiticeaViewController
@synthesize m_pTextName;
@synthesize m_pTextPwd;
@synthesize lblAboutUs;
@synthesize loginBKView;

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bk.jpg"] ];
    [super viewDidLoad];
    //UIImage *bgImage = [UIImage imageNamed:@"login_bg.png"];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    loginBKView.layer.cornerRadius = 10;
    loginBKView.layer.borderColor = [UIColor grayColor].CGColor;
    loginBKView.layer.borderWidth = 1;
    UIGlossyButton * btnLogin = (UIGlossyButton*) [self.view viewWithTag: 1000];
	[btnLogin setNavigationButtonWithColor:[UIColor doneButtonColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textDidEndOnExit:(id)sender {
}

- (IBAction)backgroundTouchDown:(id)sender
{
    [m_pTextName resignFirstResponder];
    [m_pTextPwd resignFirstResponder];
}

- (IBAction)btnLoginTouchUp:(id)sender
{
    NSString* str1 = @"http://60.12.137.82/api/chitic/appLogin?Username=";
    NSString* str2 = m_pTextName.text;
    NSString* str3 = @"&Password=";
    NSString* str4 = [self mdFive:m_pTextPwd.text];
    NSString *URLString = [[NSString alloc] init];
    URLString = [URLString stringByAppendingFormat:@"%@%@%@%@",str1,str2,str3,str4];
    //发送请求字符串
    NSLog(@"login send info:%@",URLString);
    
    //发起一个同步请求命令
    NSURL *url = [NSURL URLWithString:URLString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    
    if (!error) {
         NSData *response = [request responseData];
        //打印出获取到的网络数据
        NSString *responseStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        NSLog(@"responseStr:%@",responseStr);
        
        //将首尾的 “［ ］”去掉
        NSString *str = [responseStr stringByReplacingOccurrencesOfString:@"[" withString:@""];
        NSString *jsonStr = [str stringByReplacingOccurrencesOfString:@"]" withString:@""];
        NSLog(@"jsonStr:%@",jsonStr);
        
        NSDictionary *json = [jsonStr objectFromJSONString];
        NSString *resultValue = [json objectForKey:@"result"];

        assert(resultValue);
        NSLog(@"resultValue:%@",resultValue);
     
        //若返回值为 10000
        if ([resultValue isEqualToString:@"10000"]) {
            plantListViewController * plView = [[plantListViewController alloc] init];
            plView.title = @"电站列表";
            UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
            temporaryBarButtonItem.title = @"注销";
            self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
            [self.navigationController pushViewController:plView animated:YES];
        }else{
            [self loginErrorAlertView:@"用户名或密码输入错误，请重新输入！"];
        }
    }else{
        [self loginErrorAlertView:@"网络数据获取失败，请连入网络！"];
    }
}

-(void)loginErrorAlertView:(NSString *)errorEmssage
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"登陆失败"
                              message:[NSString stringWithFormat:errorEmssage]
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

-(NSString *)mdFive:(NSString *)str
{
    //转换成utf-8
    const char *cStr = [str UTF8String];
    //开辟一个16字节（128位：md5加密出来就是128位/bit）的空间
    unsigned char MDfiveResult[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), MDfiveResult);
    NSMutableString *mdfiveString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [mdfiveString appendFormat:@"%02X",MDfiveResult[i]];
    }
    NSLog(@"mdfiveString:%@",mdfiveString);
    return mdfiveString;
}

- (IBAction) textDidEnd:(id)sender
{
    
}

- (IBAction) lblAboutUsTouchUp:(id)sender
{
    AboutUsViewController * pAboutUsView = [[AboutUsViewController alloc] init];
    pAboutUsView.title = @"关于正泰中自";
    UIBarButtonItem *returnBarButtonItem = [[UIBarButtonItem alloc] init];
    returnBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = returnBarButtonItem;
    [self.navigationController pushViewController:pAboutUsView animated:YES];
}

@end
