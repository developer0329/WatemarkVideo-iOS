//
//  globals.h
//  G-Shot
//
//  Created by tothesky on 05/05/2017.
//  Copyright © 2017 tothesky. All rights reserved.
//

#ifndef globals_h
#define globals_h

#import "UserProfile.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "MCLocalization.h"


#define API_URL "http://greenbook.co.il/?app=app_greenshot_login"
#define USER_NOT_EXISTS "לא נמצא חשבון"
#define USER_IS_INACTIVE "חשבון לא פעיל /פג תוקף"
#define NOT_MATCHED_CREDENTIALS "פרטי התחברות שגוים"
#define ID  "מספר גלריה"
#define SECURITY "מספר אבטחה"
#define ADDING_WATERMARK_PROGRESS "מוסיף גלופה לוידאו, אנא המתן.."

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#endif /* globals_h */
