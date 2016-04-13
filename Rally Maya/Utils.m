//
//  Utils.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/7/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(UILabel *)getNavLabel:(NSString *)title{
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:0.976 green:0.961 blue:0.718 alpha:1];
    label.text = title;
    [label sizeToFit];
    return label;
    
}

+(NSString *)getAuthString{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [defaults stringForKey:@"token"];
    
    NSString *authStr = [NSString stringWithFormat:@"%@",key];
    NSString *authValue = [NSString stringWithFormat:@"Token %@", authStr];
    return authValue;
}

@end


