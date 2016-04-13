//
//  MiRallyViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/8/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiRallyViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *hotelItems;
@property (strong,nonatomic) NSString *piloto;
@property (strong,nonatomic) NSString *copiloto;
@property (strong,nonatomic) NSString *pais;
@property (strong,nonatomic) NSString *ciudad;
@property (strong,nonatomic) NSString *vehiculo;
@property (strong,nonatomic) NSString *marca;
@property (strong,nonatomic) NSString *modelo;
@property (strong,nonatomic) NSNumber *anio;
@property (strong, nonatomic) IBOutlet UITableView *tableV;

@property (strong,nonatomic) NSString *img;
@end
