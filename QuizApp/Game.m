//
//  Game.m
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-17.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import "Game.h"
#import "Question.h"

@interface Game ()

@property (nonatomic) NSMutableArray* questions;
@property (nonatomic) Question* currentQuestion;
@property (nonatomic) BOOL wasLastAnswerCorrect;

@end


@implementation Game

- (instancetype)initWithLength:(int)length {
    self = [super init];
    
    if (self) {
        _roundsWon = 0;
        _roundsLost = 0;
        _gameLength = length;
        _questions = [Question generateQuestions];
    }
    
    return self;
}

- (void)restartGame {
    NSLog(@"Questions remaining: %lu", (unsigned long) self.questions.count);
    _roundsWon = 0;
    _roundsLost = 0;
}

- (void)newQuestion {
    if (self.questions == nil || self.questions.count == 0)
        self.questions = [Question generateQuestions];
    
    int index = arc4random() % self.questions.count;
    self.currentQuestion = self.questions[index];
    [self.questions removeObjectAtIndex:index];
    
    self.wasLastAnswerCorrect = NO;
}

- (NSString*)getQuestion {
    return [self.currentQuestion getQuestion];
}

- (NSArray*)getAnswers {
    return [self.currentQuestion getAnswers];
}

- (NSString*)getCorrectAnswer {
    return [self.currentQuestion getCorrectAnswer];
}

- (int)getCurrentRound {
    return _roundsWon + _roundsLost + 1;
}

- (void)answerQuestion:(NSString*)answer {
    if ([answer isEqualToString:[self getCorrectAnswer]]) {
        self.wasLastAnswerCorrect = YES;
        _roundsWon ++;
    } else {
        self.wasLastAnswerCorrect = NO;
        _roundsLost ++;
    }
}

- (BOOL)wasAnswerCorrect {
    return self.wasLastAnswerCorrect;
}

- (BOOL)isGameFinished {
    return (self.currentRound > _gameLength);
}

@end
