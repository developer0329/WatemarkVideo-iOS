//
//  ViewController.h
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "globals.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txt_userid;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UILabel *lbl_userid;

@property (weak, nonatomic) IBOutlet UILabel *lbl_password;

@property (weak, nonatomic) IBOutlet UIImageView *img_startButton;


@end

