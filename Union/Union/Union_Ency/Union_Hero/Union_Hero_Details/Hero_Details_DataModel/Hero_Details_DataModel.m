//
//  Hero_Details_DataModel.m
//  Union
//
//  Created by HarrisHan on 15/8/8.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Hero_Details_DataModel.h"

@implementation Hero_Details_DataModel

-(void)dealloc{
    
    [_range release];
    
    [_armorBase release];
    
    [_armorLevel release];
    
    [_moveSpeed release];
    
    [_manaBase release];
    
    [_manaLevel release];
    
    [_criticalChanceBase release];
    
    [_criticalChanceLevel release];
    
    [_manaRegenBase release];
    
    [_manaRegenLevel release];
    
    [_healthRegenBase release];
    
    [_healthRegenLevel release];
    
    [_magicResistBase release];
    
    [_magicResistLevel release];
    
    [_healthBase release];
    
    [_healthLevel release];
    
    [_attackBase release];
    
    [_attackLevel release];
    
    [super dealloc];

}

@end
