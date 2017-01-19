//
//  Game.h
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-17.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, readonly) int gameLength;
@property (nonatomic, readonly) int roundsWon;
@property (nonatomic, readonly) int roundsLost;
@property (nonatomic, readonly, getter=getCurrentRound) int currentRound;

- (instancetype)initWithLength:(int) length;
- (void) newQuestion;
- (void) answerQuestion:(NSString*) answer;
- (NSString*) getQuestion;
- (NSArray*) getAnswers;
- (NSString*) getCorrectAnswer;
- (BOOL) wasAnswerCorrect;
- (BOOL) isGameFinished;

@end
