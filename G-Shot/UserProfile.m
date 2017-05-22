//
//  UserProfile.m
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import "UserProfile.h"

static UserProfile *singleton = nil;

@implementation UserProfile

+ (UserProfile *)singleton
{
    @synchronized(self)
    {
        if (nil == singleton)
        {
            singleton = [[UserProfile alloc] init];
        }
    }
    return singleton;
}

- (id)init
{
    if (self = [super init]) {
        _user_id = nil;
        _user_password = nil;
    }
    return self;
}

@end
