//
//  APIConnection.h
//  StudyJam
//
//  Created by Andy Russell on 4/14/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResponseHandlerType)(NSDictionary *response);

@interface APIConnection : NSObject

+ (void)getUserById: (NSString*)user_id responseHandler: (ResponseHandlerType)responseHandler;
+ (void)getLocationById: (NSString*)user_id responseHandler: (ResponseHandlerType)responseHandler;
+ (void)getFriendsById: (NSString*)user_id responseHandler: (ResponseHandlerType)responseHandler;

@end
