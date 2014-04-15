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

+ (void)sendGetRequestToURL:(NSString*) url onCompletion:(ResponseHandlerType) responseHandler {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *absoluteURL = [NSURL URLWithString:url relativeToURL:serverURL];
    NSURLSessionDataTask *task = [session dataTaskWithURL:absoluteURL
                                          completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              NSDictionary *responseDict = nil;
                                              
                                              // TODO: Implement actual error handling
                                              if (error) {
                                                  NSLog(@"%@", error.description);
                                              } else {
                                                  responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                              }
                                              
                                              responseHandler(responseDict);
    }];
    [task resume];
    
}

+ (void)getUserById:(NSString*) user_id completionHandler:(ResponseHandlerType) responseHandler {
    NSString *url = [NSString stringWithFormat:@"/api/user/%@", user_id];
    [self sendGetRequestToURL:url onCompletion: responseHandler];
}

@end