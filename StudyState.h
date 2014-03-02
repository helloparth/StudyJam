//
//  StudyState.h
//  StudyJam
//
//  Created by Andy Russell on 2/25/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudyState : NSObject

@property int studyLevel;

-(void) increaseFocus;
-(void) decreaseFocus;

@end
