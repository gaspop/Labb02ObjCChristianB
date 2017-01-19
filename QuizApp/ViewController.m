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
@property (weak, nonatomic) IBOutlet UILabel *labelRound;
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
    
    self.game = [[Game alloc] initWithLength:5];
    [self displayNewRound];
    [self displayGameActive];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayRoundActive {
    self.viewRoundOver.hidden = YES;

    self.labelRound.text = [NSString stringWithFormat:@"Fråga %d:", [self.game getCurrentRound]];
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
    
    NSString *gameResult, *gameCommentary;
    NSString *linebreaks = @"\n\n";
    if (self.game.roundsWon == self.game.gameLength) {
        gameCommentary = @"Bra jobbat!";
        gameResult = [NSString stringWithFormat:
                      @"Du svarade rätt på alla %d frågor.%@%@", self.game.gameLength, linebreaks, gameCommentary];
    } else if (self.game.roundsLost == self.game.gameLength) {
        gameCommentary = @"Kunde ha gått bättre...";
        gameResult = [NSString stringWithFormat:
                      @"Du svarade inte rätt på en enda fråga av %d möjliga.%@%@", self.game.gameLength, linebreaks, gameCommentary];
    } else {
        if (self.game.roundsWon > self.game.roundsLost) {
            gameCommentary = @"Bra jobbat!";
        } else {
            gameCommentary = @"Du fick ju åtminstone ett rätt!";
        }
        gameResult = [NSString stringWithFormat:
                      @"Du svarade rätt på %d frågor och fel på %d.%@%@",
                      self.game.roundsWon, self.game.roundsLost, linebreaks, gameCommentary];
    }
    self.textResult.text = gameResult;
    
    self.viewGameOver.hidden = NO;
}

- (void)displayNewRound {
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
        [self displayNewRound];
    }
}

- (IBAction)pressButtonRestart:(id)sender {
    self.game = [[Game alloc] initWithLength:5];
    [self displayNewRound];
    [self displayGameActive];
}

@end
