//
//  Question.h
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-17.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

+ (Question*) newQuestion:(NSString*)q withAnswer:(NSString*)a andBadAnswer:(NSString*)bad1 andBadAnswer:(NSString*)bad2 andBadAnswer:(NSString*)bad3;
+ (NSMutableArray*) generateQuestions;

- (NSString*) getQuestion;
- (NSArray*) getAnswers;
- (NSString*) getCorrectAnswer;

@end
