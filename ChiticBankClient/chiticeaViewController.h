//
//  chiticeaViewController.h
//  ChiticBankClient
//
//  Created by chitic on 13-4-22.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import <UIKit/UIKit.h>
@class plantListViewController;

@interface chiticeaViewController : UIViewController
{
    plantListViewController * m_plViewController;
}
@property (strong, nonatomic) IBOutlet UITextField *m_pTextName;
@property (strong, nonatomic) IBOutlet UITextField *m_pTextPwd;
@property (strong, nonatomic) IBOutlet UIButton *lblAboutUs;
@property (strong, nonatomic) IBOutlet UILabel *loginBKView;

- (IBAction) textDidEnd:(id)sender;
- (IBAction) backgroundTouchDown:(id)sender;
- (IBAction) btnLoginTouchUp:(id)sender;
- (IBAction) lblAboutUsTouchUp:(id)sender;

//
-(NSString *)mdFive:(NSString *)str;
//
-(void)loginErrorAlertView:(NSString *)errorEmssage;
@end
