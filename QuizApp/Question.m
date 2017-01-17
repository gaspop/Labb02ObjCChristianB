//
//  Question.m
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-17.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import "Question.h"

@interface Question ()

@property (nonatomic) NSString *question;
@property (nonatomic) NSArray *answers;
@property (nonatomic) NSString *correctAnswer;

@end

@implementation Question

+ (Question*) newQuestion:(NSString*)q withAnswer:(NSString*)a andBadAnswer:(NSString*)bad1 andBadAnswer:(NSString*)bad2 andBadAnswer:(NSString*)bad3 {
    Question *newQuestion = [[Question alloc] init];
    newQuestion.question = q;
    newQuestion.answers = @[a, bad1, bad2, bad3];
    newQuestion.correctAnswer = newQuestion.answers[0];
    
    return newQuestion;
}

- (BOOL) isAnswerCorrect:(NSString*)answer {
    return [self.correctAnswer isEqualToString:answer];
}

- (NSArray*) getAnswers {
    return self.answers;
}

- (NSString*) getQuestion {
    return self.question;
}

@end
