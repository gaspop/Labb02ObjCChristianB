//
//  ViewController.m
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-16.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"

@interface ViewController ()

@property (nonatomic) Game *game;
@property (weak, nonatomic) IBOutlet UIView *viewGameActive;
@property (weak, nonatomic) IBOutlet UIView *viewGameOver;
@property (weak, nonatomic) IBOutlet UIView *viewRoundActive;
@property (weak, nonatomic) IBOutlet UIView *viewRoundOver;
@property (weak, nonatomic) IBOutlet UILabel *labelAnswer;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (weak, nonatomic) IBOutlet UITextView *textQuestion;
@property (weak, nonatomic) IBOutlet UITextView *textResult;
@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIButton *buttonD;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIView setAnimationsEnabled:NO];
    
    self.game = [Game newGame];
    [self newRound];
    [self displayGameActive];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayRoundActive {
    self.viewRoundOver.hidden = YES;
    self.textQuestion.text = [self.game getQuestion];

    NSMutableArray *answers = [[self.game getAnswers] mutableCopy];
    NSMutableArray *buttons = [@[self.buttonA, self.buttonB, self.buttonC, self.buttonD] mutableCopy];
    for (int i = 0; i < 4; i ++) {
        int answer = arc4random() % answers.count;
        int button = arc4random() % buttons.count;
        [buttons[button] setTitle:answers[answer] forState:UIControlStateNormal];
        
        [answers removeObjectAtIndex:answer];
        [buttons removeObjectAtIndex:button];
    }
    self.viewRoundActive.hidden = NO;
}

- (void)displayRoundOver {
    self.viewRoundActive.hidden = YES;
    if ([self.game wasAnswerCorrect]) {
        self.labelResult.text = @"Du svarade rätt!";
    } else {
        self.labelResult.text = @"Du svarade fel!";
    }
    
    if (![self.game isGameFinished]) {
        [self.buttonNext setTitle:@"Fortsätt" forState:UIControlStateNormal];
    } else {
        [self.buttonNext setTitle:@"Visa resultat" forState:UIControlStateNormal];
    }
    
    NSString *answer = [NSString stringWithFormat: @"Svaret var: %@", [self.game getCorrectAnswer]];
    self.labelAnswer.text = answer;
    
    self.viewRoundOver.hidden = NO;
}

- (void)displayGameActive {
    self.viewGameOver.hidden = YES;
    
    self.viewGameActive.hidden = NO;
}

- (void)displayGameOver {
    self.viewGameActive.hidden = YES;
    
    int gameRoundCount = 5;
    NSString* gameResult;
    if ([self.game getRoundsWon] == gameRoundCount) {
        gameResult = [NSString stringWithFormat:
                      @"Du svarade rätt på alla %d frågor, bra jobbat!", gameRoundCount];
    } else if ([self.game getRoundsLost] == gameRoundCount) {
        gameResult = [NSString stringWithFormat:
                      @"Du svarade inte rätt på en enda fråga av %d möjliga, bra jobbat!", gameRoundCount];
    } else {
        gameResult = [NSString stringWithFormat:
                      @"Du svarade rätt på %d frågor och fel på %d. Bra jobbat!",
                      [self.game getRoundsWon], [self.game getRoundsLost]];
    }
    self.textResult.text = gameResult;
    
    self.viewGameOver.hidden = NO;
}

- (void)newRound {
    [self.game newQuestion];
    
    [self displayRoundActive];
    
}

- (IBAction)pressButton:(UIButton*)sender {
    NSString* answer = sender.currentTitle;
    [self.game answerQuestion:answer];
    [self displayRoundOver];
}

- (IBAction)pressButtonContinue:(id)sender {
    if ([self.game isGameFinished]) {
        [self displayGameOver];
    } else {
        [self newRound];
    }
}
- (IBAction)pressButtonRestart:(id)sender {
    self.game = [Game newGame];
    [self newRound];
    [self displayGameActive];
}

@end
