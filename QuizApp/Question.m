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
    newQuestion.correctAnswer = a;
    
    return newQuestion;
}

- (NSString*)getQuestion {
    return self.question;
}

- (NSArray*)getAnswers {
    return self.answers;
}

- (NSString*)getCorrectAnswer {
    return self.correctAnswer;
}

+ (NSMutableArray*) generateQuestions {
    NSLog(@"Generating new questions!");
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [array addObject:[Question newQuestion:@"Vilken av turtlarna använder Katanas som vapen?"
                                withAnswer:@"Leonardo"
                              andBadAnswer:@"Michaelangelo" andBadAnswer:@"Donatello" andBadAnswer:@"Lennart"]];
    
    [array addObject:[Question newQuestion:@"Vad heter Bamses vän Lille Skutt?"
                                withAnswer:@"Lille Skutt"
                              andBadAnswer:@"Skalman" andBadAnswer:@"Bengt" andBadAnswer:@"Lennart"]];
    
    [array addObject:[Question newQuestion:@"Vad är roten av 25?"
                                withAnswer:@"5"
                              andBadAnswer:@"8" andBadAnswer:@"7" andBadAnswer:@"Lennart"]];
    
    [array addObject:[Question newQuestion:@"Vem regisserade filmen \"The Thing\" från 1982?"
                                withAnswer:@"John Carpenter"
                              andBadAnswer:@"Wes Craven" andBadAnswer:@"Brian De Palma" andBadAnswer:@"James Cameron"]];
    
    [array addObject:[Question newQuestion:@"I vilket land ligger staden Korpilombolo?"
                                withAnswer:@"Sverige"
                              andBadAnswer:@"Finland" andBadAnswer:@"Nigeria" andBadAnswer:@"Ghana"]];
    
    [array addObject:[Question newQuestion:@"Vilket år släppte Michael Jackson albumet \"Bad\"?"
                                withAnswer:@"1987"
                              andBadAnswer:@"1991" andBadAnswer:@"1983" andBadAnswer:@"1989"]];
    
    [array addObject:[Question newQuestion:@"Vem skrev boken \"Dumskallarnas Sammansvärjning\"?"
                                withAnswer:@"John Kennedy Toole"
                              andBadAnswer:@"Robert Shea" andBadAnswer:@"Stephen King" andBadAnswer:@"J.D. Salinger"]];
    
    [array addObject:[Question newQuestion:@"Vilken studio utvecklade spelserien \"Quest for Glory\" mellan åren 1989 till 1998?"
                                withAnswer:@"Sierra"
                              andBadAnswer:@"Westwood Studios" andBadAnswer:@"LucasArts" andBadAnswer:@"Origin Systems"]];
    
    [array addObject:[Question newQuestion:@"Vilket år hade TV-Serien \"Twin Peaks\" premiär?"
                                withAnswer:@"1990"
                              andBadAnswer:@"1988" andBadAnswer:@"1992" andBadAnswer:@"1986"]];
    
    [array addObject:[Question newQuestion:@"Vem är upphovsman till Kalle Anka?"
                                withAnswer:@"Walt Disney"
                              andBadAnswer:@"Carl Barks" andBadAnswer:@"Carl Lennart" andBadAnswer:@"Rune Andreasson"]];
    
    NSLog(@"Questions generated: %d", (int) [array count]);
    
    return array;
}

@end
