//
//  SimplePlantTableViewCell.m
//  ChiticBankClient
//
//  Created by chitic on 13-4-24.
//  Copyright (c) 2013年 chitic. All rights reserved.
//

#import "SimplePlantTableViewCell.h"

@implementation SimplePlantTableViewCell

@synthesize lbPlantName;
@synthesize imgviewPlant;
@synthesize lbPowerValue;
@synthesize lbDailyEnergyValue;

@synthesize PlantName;
@synthesize PlantImage;
@synthesize PowerValue;
@synthesize DailyEnergyValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setImage:(UIImage *)img {
    if (![img isEqual:PlantImage]) {
        PlantImage = [img copy];
        self.imgviewPlant.image = PlantImage;
    }
}

-(void)setPlantName:(NSString *)strPlantName {
    if (![strPlantName isEqualToString:PlantName]) {
        PlantName = [strPlantName copy];
        self.lbPlantName.text = PlantName;
    }
}

-(void)setPowerValue:(NSString *)d {
    if (![d isEqualToString:PowerValue]) {
        PowerValue = [d copy];
        self.lbPowerValue.text = PowerValue;
    }
}

-(void)setDailyEnergyValue:(NSString *)l {
    if (![l isEqualToString:DailyEnergyValue]) {
        DailyEnergyValue = [l copy];
        self.lbDailyEnergyValue.text = DailyEnergyValue;
    }
}

@end
