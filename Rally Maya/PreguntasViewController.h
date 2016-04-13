//
//  PreguntasViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 3/29/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMAccordionTableViewController.h"
@interface PreguntasViewController : KMAccordionTableViewController
@property (nonatomic,strong)  UIColor *rowColor;
@property (nonatomic,strong) NSMutableArray *items;
@end
