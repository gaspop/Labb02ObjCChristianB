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

@end

@implementation Game


+ (Game*) newGame {
    
    Game *game = [[Game alloc] init];
    game.questions = [self generateQuestions];
    
    return game;
}

- (void) newQuestion {
    if (self.questions == nil || self.questions.count == 0)
        self.questions = [Game generateQuestions];
    
    int index = arc4random() % self.questions.count;
    self.currentQuestion = self.questions[index];
    [self.questions removeObjectAtIndex:index];
}

- (NSString*) getQuestion {
    return [self.currentQuestion getQuestion];
}

- (NSArray*) getAnswers {
    return [self.currentQuestion getAnswers];
}

- (BOOL)makeGuess:(NSString*)guess {
    return [self.currentQuestion isAnswerCorrect:guess];
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
