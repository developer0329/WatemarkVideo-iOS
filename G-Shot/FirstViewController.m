//
//  FirstViewController.m
//  G-Shot
//
//  Created by tothesky on 11/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btn_search:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://greenbook.co.il/?app=card_search"]];

}

- (IBAction)btn_star:(UIButton *)sender {
    
    NSString *str_isSaved = [[NSUserDefaults standardUserDefaults] valueForKey:@"clickStarButton"];
    if([str_isSaved isEqualToString:@"YES"])
    {
        NSString *str_first = [[NSUserDefaults standardUserDefaults] valueForKey:@"firstValue"];
        NSString *str_second = [[NSUserDefaults standardUserDefaults] valueForKey:@"secondValue"];

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.greenbook.co.il/card/%@/%@",str_first,str_second]]];
    }
    else
    {
        [self performSegueWithIdentifier:@"segue_show_two" sender:self];
    }
}

- (IBAction)btn_mobile:(UIButton *)sender {
    
}
- (IBAction)btn_heart:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.greenbook.co.il/?app=mb"]];
}
- (IBAction)btn_world:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://greenbook.co.il/?app=sprt&ln=he"]];
}
- (IBAction)btn_button:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://req.greenbook.co.il/lp/100"]];
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
