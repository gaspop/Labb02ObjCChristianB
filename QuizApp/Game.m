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
@property (nonatomic) int roundsWon;
@property (nonatomic) int roundsLost;
@property (nonatomic) BOOL wasLastAnswerCorrect;

@end

@implementation Game


+ (Game*)newGame {
    
    Game *game = [[Game alloc] init];
    game.questions = [self generateQuestions];
    game.roundsWon = 0;
    game.roundsLost = 0;
    
    return game;
}

- (void)newQuestion {
    if (self.questions == nil || self.questions.count == 0)
        self.questions = [Game generateQuestions];
    
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

- (void)answerQuestion:(NSString*)answer {
    if ([answer isEqualToString:[self getCorrectAnswer]]) {
        self.wasLastAnswerCorrect = YES;
        self.roundsWon ++;
    } else {
        self.wasLastAnswerCorrect = NO;
        self.roundsLost ++;
    }
}

- (BOOL)wasAnswerCorrect {
    return self.wasLastAnswerCorrect;
}

- (BOOL)isGameFinished {
    return (self.roundsWon + self.roundsLost >= 5);
}

- (int)getRoundsWon {
    return self.roundsWon;
}

- (int)getRoundsLost {
    return self.roundsLost;
}

+ (NSMutableArray*) generateQuestions {
    NSLog(@"Generating new questions!");
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [array addObject:[Question newQuestion:@"Vem av turtlarna använder Katanas som vapen?"
                                withAnswer:@"Leonardo"
                              andBadAnswer:@"Michaelangelo" andBadAnswer:@"Donatello" andBadAnswer:@"Lennart"]];
    
    [array addObject:[Question newQuestion:@"Vad heter Bamses vän Lille Skutt?"
                                withAnswer:@"Lille Skutt"
                              andBadAnswer:@"Skalman" andBadAnswer:@"Bengt" andBadAnswer:@"Lennart"]];
    
    [array addObject:[Question newQuestion:@"Vad är roten av 25?"
                                withAnswer:@"5"
                              andBadAnswer:@"8" andBadAnswer:@"7" andBadAnswer:@"Lennart"]];
    
    return array;
}

@end
