//
//  APIConnection.m
//  StudyJam
//
//  Created by Andy Russell on 4/14/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "APIConnection.h"

static NSURL *serverURL = nil;

@implementation APIConnection

+ (void)initialize {
    // TODO: Change to hosted server
    serverURL = [NSURL URLWithString:@"http://localhost:5000"];
}

+(NSDictionary*) getUserById:(int) user_id {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"/api/user/4045130232" relativeToURL:serverURL];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                 // TODO: Actual error handling
                 if (error) {
                     NSLog(@"%@", error.description);
                     return;
                 }
                 
                 NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                 NSLog(@"%@", string);
             }];
    [task resume];
    return [NSDictionary new];
}

@end
