//
//  WorkViewController.h
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface WorkViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_captureButton;
@property (weak, nonatomic) IBOutlet UIButton *btn_rightButton;

@property (weak, nonatomic) IBOutlet UIButton *btn_leftButton;

@property (weak, nonatomic) IBOutlet UIButton *btn_modeSelectorButton;
@property (weak, nonatomic) IBOutlet UIButton *btn_changeCameraButton;
@property (weak, nonatomic) IBOutlet UIButton *btn_galeryButton;
@property (weak, nonatomic) IBOutlet UIButton *btn_updateWatermarksButton;


@property (weak, nonatomic) IBOutlet UIImageView *img_watermarkview;


@property (weak, nonatomic) UIViewController *currentViewController;


@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *thumbs;
@property (nonatomic, strong) NSMutableArray *assets;

@property (nonatomic, strong) ALAssetsLibrary *ALAssetsLibrary;

@end
