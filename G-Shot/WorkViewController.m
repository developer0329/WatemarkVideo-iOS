//
//  WorkViewController.m
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import "WorkViewController.h"
#import "globals.h"
#import <SDWebImage/UIImageView+WebCache.h>

typedef NS_ENUM( NSInteger, AVCamCaptureMode ) {
    MyCamCaptureModeCamera = 0,
    MyCamCaptureModeVideo = 1
};

@interface WorkViewController ()
{
    NSMutableArray *array_data;
    NSUInteger currentSelectedWaterMark;
    NSUInteger currentModeCameraVideo;
    BOOL isRecordingVideo;
}
@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array_data = [NSMutableArray new];
    currentSelectedWaterMark = 0;
    currentModeCameraVideo = MyCamCaptureModeCamera;
    
    [self SETUPGUI];
    [self checkButtonState];
    [self ReloadWaterMarkData];
    
    self.navigationController.navigationBar.hidden = YES;

    isRecordingVideo = NO;
    // Do any additional setup after loading the view.
}

- (IBAction)btn_captureButton:(UIButton *)sender {
    
    
    if(currentModeCameraVideo == MyCamCaptureModeCamera)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"notification_take_photo" object:nil];
        
    }
    else if(currentModeCameraVideo == MyCamCaptureModeVideo)
    {
        if(!isRecordingVideo)
        {
            [_btn_captureButton setImage:[UIImage imageNamed:@"video_active"] forState:normal];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notification_start_recording" object:nil];

        }
        else
        {
            [_btn_captureButton setImage:[UIImage imageNamed:@"videooff"] forState:normal];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notificaiton_end_recording" object:nil];

        }
        isRecordingVideo = !isRecordingVideo;
        
    }
}

-(void)viewDidAppear:(BOOL)animate{
    [super viewDidAppear:animate];
    
}
- (IBAction)left_button_click:(UIButton *)sender {
    
    if(currentSelectedWaterMark >0)
        currentSelectedWaterMark --;
    
    [UserProfile singleton].currentWaterMark = [array_data objectAtIndex:currentSelectedWaterMark];

    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:[UserProfile singleton].currentWaterMark] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        [UserProfile singleton].currentWaterMarkImageFile = image;
        _img_watermarkview.image = [UserProfile singleton].currentWaterMarkImageFile;
        
    }];
 
    [self checkButtonState];

}
- (IBAction)right_button_click:(UIButton *)sender {

    if(currentSelectedWaterMark < [array_data count] - 1)
        currentSelectedWaterMark ++;
    
    [UserProfile singleton].currentWaterMark = [array_data objectAtIndex:currentSelectedWaterMark];

    
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:[UserProfile singleton].currentWaterMark] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        [UserProfile singleton].currentWaterMarkImageFile = image;
        _img_watermarkview.image = [UserProfile singleton].currentWaterMarkImageFile;
    }];
    
    [self checkButtonState];
}
-(void)checkButtonState
{

    
    if(currentSelectedWaterMark == 0)
    {
        [_btn_leftButton setImage:[UIImage imageNamed:@"left_buttonselected"] forState:UIControlStateNormal];
    }
    else if(currentSelectedWaterMark == [array_data count] - 1)
    {
        [_btn_rightButton setImage:[UIImage imageNamed:@"rightbutton_selected"] forState:UIControlStateNormal];

    }
    else
    {
        [_btn_leftButton setImage:[UIImage imageNamed:@"left_button_notselected"] forState:UIControlStateNormal];
        
        [_btn_rightButton setImage:[UIImage imageNamed:@"rightbutton_notselected"] forState:UIControlStateNormal];
    }
}
- (IBAction)btn_mode_click:(UIButton *)sender {
    [sender setHighlighted:NO];

    if(sender.tag == 0)
    {
        sender.tag = 1;
        [_btn_modeSelectorButton setImage:[UIImage imageNamed:@"videoselected"] forState:UIControlStateNormal];
        
        
        [_btn_captureButton setImage:[UIImage imageNamed:@"videooff"] forState:UIControlStateHighlighted];

        [_btn_captureButton setImage:[UIImage imageNamed:@"videooff"] forState:UIControlStateNormal];
        
        [UserProfile singleton].photoOrVideo = 1;
        currentModeCameraVideo = MyCamCaptureModeVideo;

        
    }
    else if(sender.tag == 1)
    {
        sender.tag = 0;
        [_btn_modeSelectorButton setImage:[UIImage imageNamed:@"cameraselected"] forState:UIControlStateNormal];
        
        
        [_btn_captureButton setImage:[UIImage imageNamed:@"cameraon"] forState:UIControlStateHighlighted];

        [_btn_captureButton setImage:[UIImage imageNamed:@"cameraoff"] forState:UIControlStateNormal];

        [UserProfile singleton].photoOrVideo = 0;
        currentModeCameraVideo = MyCamCaptureModeCamera;

    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification_photoVideo" object:nil];
}
- (IBAction)btn_camera_click:(UIButton *)sender {
    [sender setHighlighted:NO];

    
    if(sender.tag == 0)
    {
        sender.tag = 1;
        [_btn_changeCameraButton setImage:[UIImage imageNamed:@"change_camera_front"] forState:UIControlStateNormal];
    }
    else if(sender.tag == 1)
    {
        sender.tag = 0;
        [_btn_changeCameraButton setImage:[UIImage imageNamed:@"change_camera_back"] forState:UIControlStateNormal];

    }
    
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notification_rotate_camera" object:self];
}
- (IBAction)btn_gallery_click:(UIButton *)sender {
    [sender setHighlighted:NO];    
    
    if(sender.tag == 0)
    {
        sender.tag = 1;
        [_btn_galeryButton setImage:[UIImage imageNamed:@"galery_pressed"] forState:UIControlStateNormal];

    }
    else if(sender.tag == 1)
    {
        sender.tag = 0;
        [_btn_galeryButton setImage:[UIImage imageNamed:@"galary_shortcut"] forState:UIControlStateNormal];

    }
    
    
    // if capture image is not supported by the device or Stimaulator

}
-(NSMutableArray *) getContentFrom:(ALAssetsGroup *) group withAssetFilter:(ALAssetsFilter *)filter
{
    NSMutableArray *contentArray = [NSMutableArray array];
    [group setAssetsFilter:filter];
    
    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        
        //ALAssetRepresentation holds all the information about the asset being accessed.
        if(result)
        {
            
            ALAssetRepresentation *representation = [result defaultRepresentation];
            
            //Stores releavant information required from the library
            NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] init];
            //Get the url and timestamp of the images in the ASSET LIBRARY.
            NSString *imageUrl = [representation UTI];
            NSDictionary *metaDataDictonary = [representation metadata];
            NSString *dateString = [result valueForProperty:ALAssetPropertyDate];
            
            //            NSLog(@"imageUrl %@",imageUrl);
            //            NSLog(@"metadictionary: %@",metaDataDictonary);
            
            //Check for the date that is applied to the image
            // In case its earlier than the last sync date then skip it. ##TODO##
            
            NSString *imageKey = @"ImageUrl";
            NSString *metaKey = @"MetaData";
            NSString *dateKey = @"CreatedDate";
            
            [tempDictionary setObject:imageUrl forKey:imageKey];
            [tempDictionary setObject:metaDataDictonary forKey:metaKey];
            [tempDictionary setObject:dateString forKey:dateKey];
            
            //Add the values to photos array.
            [contentArray addObject:tempDictionary];
        }
    }];
    return contentArray;
}
- (IBAction)btn_update_click:(UIButton *)sender {
    [sender setHighlighted:NO];

    if(sender.tag == 0)
    {
        sender.tag = 1;
        [_btn_updateWatermarksButton setImage:[UIImage imageNamed:@"update_watermarks"] forState:UIControlStateNormal];

    }
    else if(sender.tag == 1)
    {
        sender.tag = 0;
        [_btn_updateWatermarksButton setImage:[UIImage imageNamed:@"watermarksuptodate"] forState:UIControlStateNormal];

    }
}

-(void)SETUPGUI
{
    [_btn_captureButton setImage:[UIImage imageNamed:@"cameraoff"] forState:UIControlStateNormal];
    [_btn_captureButton setImage:[UIImage imageNamed:@"cameraon"] forState:UIControlStateHighlighted];
    
    [_btn_rightButton setImage:[UIImage imageNamed:@"rightbutton_notselected"] forState:UIControlStateNormal];
     [_btn_rightButton setImage:[UIImage imageNamed:@"rightbutton_selected"] forState:UIControlStateHighlighted];
    
    [_btn_leftButton setImage:[UIImage imageNamed:@"left_button_notselected"] forState:UIControlStateNormal];
    [_btn_leftButton setImage:[UIImage imageNamed:@"left_buttonselected"] forState:UIControlStateHighlighted];
    
    _btn_modeSelectorButton.tag = 0;
    _btn_changeCameraButton.tag = 0;
    _btn_galeryButton.tag = 0;
    _btn_updateWatermarksButton.tag = 0;
    
    
    _btn_modeSelectorButton.adjustsImageWhenHighlighted = NO;
    _btn_changeCameraButton.adjustsImageWhenHighlighted = NO;
    _btn_galeryButton.adjustsImageWhenHighlighted = NO;
    _btn_updateWatermarksButton.adjustsImageWhenHighlighted = NO;

    
}
-(void)ReloadWaterMarkData
{
    [SVProgressHUD showWithStatus:[MCLocalization stringForKey:@"downloading_watermarks"]];
    NSString *str_apiURL = [NSString stringWithFormat:@"%s&id=%@&secure_num=%@&files=1",API_URL,[UserProfile singleton].user_id,[UserProfile singleton].user_password];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:str_apiURL parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSDictionary *dict = responseObject;
        
        NSString *str_apiNum = [dict objectForKey:@"apiNum"];
        if([str_apiNum isEqualToString:@"-4"])
        {
            NSArray *arry_keys = [dict allKeys];
            for(int i = 0 ;i<[arry_keys count];i++)
            {
                NSString *str_key = arry_keys[i];
                if ([str_key rangeOfString:@"apifile"].location != NSNotFound) {
                    [array_data addObject:[dict objectForKey:str_key]];
                    
                }
            }
            [self gotoNextWaterMarkDiaplayAction];

        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        
        NSLog(@"%@", error.description);
        
    }];

    

}
-(void)gotoNextWaterMarkDiaplayAction
{
    currentSelectedWaterMark = 0;
    [UserProfile singleton].currentWaterMark = [array_data objectAtIndex:0];
    
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:[UserProfile singleton].currentWaterMark] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        [UserProfile singleton].currentWaterMarkImageFile = image;
        _img_watermarkview.image = [UserProfile singleton].currentWaterMarkImageFile;
        
    }];

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
