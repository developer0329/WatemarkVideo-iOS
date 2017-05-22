//
//  APIServiceManager.m
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import "APIServiceManager.h"

@implementation APIServiceManager
static APIServiceManager *serviceSingleton = nil;

+ (APIServiceManager *)singleton
{
    @synchronized(self)
    {
        if (nil == serviceSingleton)
        {
            serviceSingleton = [[APIServiceManager alloc] init];
        }
    }
    return serviceSingleton;
}
- (void)userLoginAPI:(NSDictionary *)parameters
             apiName:(NSString *)apiName
       requestMethod:(NSString*)requestMethod
             success:(void (^)(NSString *message))success failure:(void (^)(NSString *error))failure
{
   
}


@end
