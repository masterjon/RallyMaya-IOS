//
//  DirectorioViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 3/2/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectorioViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *itemsTable;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
    @property (strong,nonatomic) NSMutableArray *collectionItems;
@end
