//
//  TwoTextFieldViewController.m
//  G-Shot
//
//  Created by tothesky on 11/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import "TwoTextFieldViewController.h"

@interface TwoTextFieldViewController ()

@end

@implementation TwoTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btn_savebutton:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setValue:_text_fiirst.text forKey:@"firstValue"];
    
    [[NSUserDefaults standardUserDefaults] setValue:_text_second.text forKey:@"secondValue"];

    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"clickStarButton"];


    
    [self performSegueWithIdentifier:@"segue_show_first" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
