//
//  APIConnection.h
//  StudyJam
//
//  Created by Andy Russell on 4/14/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConnection : NSObject

+ (NSDictionary*) getUserById: (int)user_id;

@end
