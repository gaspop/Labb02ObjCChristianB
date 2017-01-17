//
//  Game.h
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-17.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

+ (Game*) newGame;
- (void) newQuestion;
- (NSString*) getQuestion;
- (NSArray*) getAnswers;
- (NSString*) getCorrectAnswer;
- (BOOL) isGameFinished;
- (BOOL) wasAnswerCorrect;
- (int) getRoundsWon;
- (int) getRoundsLost;
- (void) answerQuestion:(NSString*) answer;

@end
