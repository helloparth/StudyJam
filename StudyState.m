//
//  StudyState.m
//  StudyJam
//
//  Created by Andy Russell on 2/25/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "StudyState.h"

@implementation StudyState

static const int MAX_STUDY_LEVEL = 3;
static const int MIN_STUDY_LEVEL = 0;

-(void)increaseFocus {
    if (self.studyLevel < MAX_STUDY_LEVEL)
    self.studyLevel += 1;
}

-(void)decreaseFocus {
    if (self.studyLevel > MIN_STUDY_LEVEL) {
        self.studyLevel -= 1;
    }
}

- (UIColor*)getStudyLevelColor {
    switch (self.studyLevel) {
        case 0:
            return [UIColor greenColor];
            break;
            
        case 1:
            return [UIColor yellowColor];
            break;
            
        case 2:
            return [UIColor orangeColor];
            break;
            
        case 3:
            return [UIColor redColor];
            break;
            
        default:
            return [UIColor whiteColor];
    }
}


@end
