//
//  PostalDetalleViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 3/24/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostalDetalleViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong,nonatomic) NSString *selectedImg;
@property (strong,nonatomic) NSString *hashtag;
@property (weak, nonatomic) IBOutlet UIImageView *cardImg;
@property (weak, nonatomic) IBOutlet UIImageView *userImg;
@property (weak, nonatomic) IBOutlet UIImage *userImage;
- (IBAction)takePicBtn:(UIButton *)sender;
- (IBAction)selectPicBtn:(UIButton *)sender;
- (IBAction)savePicBtn:(UIButton *)sender;
- (IBAction)shareBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end
