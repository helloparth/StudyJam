//
//  APIConnection.h
//  StudyJam
//
//  Created by Andy Russell on 4/14/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResponseHandlerType)(NSDictionary *response);

/**
 * `APIConnection` abstracts the StudyJam backend API, allowing for a client to
 * easily request data from the server asynchronously.
 */
@interface APIConnection : NSObject

/**
 * Retrives user profile information from the server.
 *
 * @param user_id The user whose information the server should return
 * @param responseHandler When the request completes, this block will be called
 * with a dictionary representing the JSON returned by the server.
 */
+ (void)getUserById: (NSString*)user_id responseHandler: (ResponseHandlerType)responseHandler;

/**
 * Retrives user location and study level information from the server.
 *
 * @param user_id The user whose location the server should return.
 * @param responseHandler When the request completes, this block will be called
 * with a dictionary respresenting the JSON returned by the server.
 */
+ (void)getLocationById: (NSString*)user_id responseHandler: (ResponseHandlerType)responseHandler;

/**
 * Retrieves a list of user ids of a user's friends from the server.
 *
 * @param user_id The user whose friends the server should return.
 * @param responseHandler When the request completes, this block will be called
 * with a dictionary representing the JSON returned by the server.
 */
+ (void)getFriendsById: (NSString*)user_id responseHandler: (ResponseHandlerType)responseHandler;

@end
