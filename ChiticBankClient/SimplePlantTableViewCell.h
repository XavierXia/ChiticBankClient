//
//  SimplePlantTableViewCell.h
//  ChiticBankClient
//
//  Created by chitic on 13-4-24.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimplePlantTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbPlantName;
@property (strong, nonatomic) IBOutlet UIImageView *imgviewPlant;
@property (strong, nonatomic) IBOutlet UILabel *lbPowerValue;
@property (strong, nonatomic) IBOutlet UILabel *lbDailyEnergyValue;

@property (strong, nonatomic) NSString *PlantName;
@property (strong, nonatomic) UIImage *PlantImage;
@property (strong, nonatomic) NSString *PowerValue;
@property (strong, nonatomic) NSString *DailyEnergyValue;

@end
