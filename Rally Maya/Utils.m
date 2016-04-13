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
    label.textColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];/*#ffdb7b*/
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


