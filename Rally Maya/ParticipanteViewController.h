//
//  ParticipanteViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParticipanteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) NSString *imagenUrl;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSNumber *year;
@property (strong,nonatomic) NSString *brand;
@property (strong,nonatomic) NSString *model;
@property (strong,nonatomic) NSString *country;
@property (strong,nonatomic) NSNumber *position;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;

@property (strong, nonatomic) IBOutlet UILabel *yearLbl;
@property (weak, nonatomic) IBOutlet UILabel *brandLbl;
@property (weak, nonatomic) IBOutlet UILabel *modelLbl;
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *positionLbl;

@end
