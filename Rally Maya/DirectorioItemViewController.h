//
//  DirectorioItemViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/10/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectorioItemViewController : UIViewController
@property (strong, nonatomic) NSString *titulo;
@property (strong, nonatomic) NSNumber *cityId;
@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSNumber *itemId;
@property (strong,nonatomic) NSMutableArray *collectionItems;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@end
