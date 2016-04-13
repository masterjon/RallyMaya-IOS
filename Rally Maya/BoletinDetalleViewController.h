//
//  BoletinDetalleViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoletinDetalleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *tituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *fechaLabel;
@property (strong, nonatomic) IBOutlet UITextView *bodyText;


@property (strong, nonatomic) NSString *titulo;
@property (strong, nonatomic) NSString *fecha;
@property (strong, nonatomic) NSString *noticiaBody;

@end
