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

@end

@implementation Question

+ (Question*) newQuestion:(NSString*)q withAnswer:(NSString*)a andBadAnswer:(NSString*)bad1 andBadAnswer:(NSString*)bad2 andBadAnswer:(NSString*)bad3 {
    Question *newQuestion = [[Question alloc] init];
    newQuestion.question = q;
    newQuestion.answers = @[a, bad1, bad2, bad3];
    
    return newQuestion;
}

- (NSString*)getQuestion {
    return self.question;
}

- (NSArray*)getAnswers {
    return self.answers;
}

// Answer at Index 0 is always the right answer.
- (NSString*)getCorrectAnswer {
    return self.answers[0];
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
    
    [array addObject:[Question newQuestion:@"Vad är den kemiska formeln för bajs?"
                                withAnswer:@"Det finns ingen"
                              andBadAnswer:@"B4J5" andBadAnswer:@"Ba(NO3)2" andBadAnswer:@"H20"]];
    
    [array addObject:[Question newQuestion:@"Vad kallas jultomten i tyskland?"
                                withAnswer:@"Weihnachtsmann"
                              andBadAnswer:@"Radmann" andBadAnswer:@"Nikolaus Weihnacht" andBadAnswer:@"Radgarten"]];
    
    [array addObject:[Question newQuestion:@"Vad var artisten Prince fullständiga namn?"
                                withAnswer:@"Prince Rogers Nelson"
                              andBadAnswer:@"Sven Bertil Prince" andBadAnswer:@"David Prince Jones" andBadAnswer:@"Bengt Prince"]];
    
    [array addObject:[Question newQuestion:@"Vilket år lanserades Super Nintendo i Sverige?"
                                withAnswer:@"1992"
                              andBadAnswer:@"1990" andBadAnswer:@"1993" andBadAnswer:@"1995"]];
    
    [array addObject:[Question newQuestion:@"Vem regisserade filmen \"Stalker\" från 1979?"
                                withAnswer:@"Andrej Tarkovskij"
                              andBadAnswer:@"Krzysztof Kieslowski" andBadAnswer:@"Andrej Kissochbajslowski" andBadAnswer:@"Krzysztof Tarkovskij"]];
    
    NSLog(@"Questions generated: %d", (int) [array count]);
    
    return array;
}

@end
