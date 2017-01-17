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
- (BOOL) makeGuess:(NSString*) guess;

@end
