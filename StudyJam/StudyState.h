//
//  StudyState.h
//  StudyJam
//
//  Created by Andy Russell on 2/25/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Simple wrapper for the "study state" of a user. The study state is an
 * integer representing how focused the user reports themselves. The higher the
 * number, the higher the focus.
 */
@interface StudyState : NSObject

@property int studyLevel;

/**
 * Construct a StudyLevel object with an initial level.
 */
-(id) initWithLevel:(int)level;

/**
 * Increase the study level by 1.
 */
-(void) increaseFocus;

/**
 * Decrease the study level by 1.
 */
-(void) decreaseFocus;

/**
 * Returns a color which represents the current study level. This method should
 * be used where it would be helpful for the user to have a quick visual
 * indication of a study level.
 */
-(UIColor*) getStudyLevelColor;

@end
