//
//  DiccionarioViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiccionarioViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableV;
@property (strong,nonatomic) NSMutableArray *collectionItems;
@end
