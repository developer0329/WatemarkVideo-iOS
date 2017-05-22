//
//  APIServiceManager.h
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "globals.h"


@interface APIServiceManager : NSObject
+ (APIServiceManager *)singleton;

- (void)userLoginAPI:(NSDictionary *)parameters
             apiName:(NSString *)apiName
       requestMethod:(NSString*)requestMethod
             success:(void (^)(NSString *message))success failure:(void (^)(NSString *error))failure;


@end
