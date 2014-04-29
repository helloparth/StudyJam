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

-(id)initWithLevel:(int)level {
    self = [super init];
    if (self) {
        self.studyLevel = level;
    }
    return self;
}

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
            // Dark purple
            return [UIColor colorWithRed:178/255.0f green:23/255.0f blue:173/255.0f alpha:1.0f];
            break;
            
        case 1:
            // Royal blue
            return [UIColor colorWithRed:44/255.0f green:104/255.0f blue:193/255.0f alpha:1.0f];
            break;
            
        case 2:
            return [UIColor orangeColor];
            break;
            
        case 3:
            // Pinkish red
            return [UIColor colorWithRed:214/255.0f green:55/255.0f blue:84/255.0f alpha:1.0f];
            break;
            
        default:
            return [UIColor whiteColor];
    }
}

-(NSString*)getStudyLevelText {
    switch(self.studyLevel) {
        case 0:
            return @"Just Chillin'";
        case 1:
            return @"Slow Jammin'";
        case 2:
            return @"Straight Crammin'";
        case 3:
            return @"Finals Examin'";
        default:
            return @"";
    }
}

@end
