//
//  UserProfile.h
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserProfile : NSObject

+ (UserProfile *)singleton;


@property (strong, nonatomic) NSString *user_id;
@property (strong, nonatomic) NSString *user_password;
@property (readwrite, assign) NSUInteger photoOrVideo;
@property (readwrite, assign) NSString *currentWaterMark;
@property (strong, nonatomic) UIImage *currentWaterMarkImageFile;




@end
