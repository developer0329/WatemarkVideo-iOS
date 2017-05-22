//
//  ViewController.m
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import "ViewController.h"
#import "MCLocalization.h"
#import "APIServiceManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SETUPGUI];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)clickStartButton{
    [SVProgressHUD showWithStatus:@"Loading..."];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    
    NSString *str_api = [NSString stringWithFormat:@"%s&id=%@&secure_num=%@",API_URL,_txt_userid.text,_txt_password.text];
    [manager GET:str_api parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSDictionary *dict = responseObject;
        
        NSString *str_apiMsg = [responseObject objectForKey:@"apiMsg"];
        NSString *str_apiNum = [responseObject objectForKey:@"apiNum"];

        if([str_apiMsg isEqualToString:@"ACTIVE"])
        {
            [UserProfile singleton].user_id = _txt_userid.text;
            [UserProfile singleton].user_password = _txt_password.text;
            [self performSegueWithIdentifier:@"segue_showWorkView" sender:self];
        }
        else
        {
            if([str_apiNum isEqualToString:@"-1"])
            {
                
            }
            else if([str_apiNum isEqualToString:@"-2"])
            {
                
            }
            else if([str_apiNum isEqualToString:@"-3"])
            {
                
            }
            else
            {
                
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        
        NSLog(@"%@", error.description);
        
    }];

    
}
-(void)SETUPGUI
{
    _lbl_userid.text = [MCLocalization stringForKey:@"username"];
    _lbl_password.text = [MCLocalization stringForKey:@"password"];
    
    _txt_userid.backgroundColor =UIColorFromRGB(0x748E02) ;
    _txt_userid.layer.borderColor = [UIColor whiteColor].CGColor;
    _txt_userid.layer.borderWidth = 3;
    _txt_userid.layer.cornerRadius = 15;
    
    _txt_password.backgroundColor = UIColorFromRGB(0x748E02);
    _txt_password.layer.borderColor = [UIColor whiteColor].CGColor;
    _txt_password.layer.borderWidth = 3;
    _txt_password.layer.cornerRadius = 15;

    _img_startButton.layer.cornerRadius = 30;

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickStartButton)];
    singleTap.numberOfTapsRequired = 1;
    [_img_startButton setUserInteractionEnabled:YES];
    [_img_startButton addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
