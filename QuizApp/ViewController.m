//
//  ViewController.m
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-16.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import "ViewController.h"
#import "ColorSet.h"
#import "Game.h"

@interface ViewController ()

@property (nonatomic) Game *game;

@property (strong, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewIndentation;
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
@property (weak, nonatomic) IBOutlet UIButton *buttonRestart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIView setAnimationsEnabled:NO];
    self.buttonA.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonB.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonC.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonD.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.game = [[Game alloc] initWithLength:5];
    [self displayNewRound];
    [self displayGameActive];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayNewRound {
    [self.game newQuestion];
    [self setAppTheme:[[ColorSet alloc]initBlue]];
    [self displayRoundActive];
}

- (void)displayRoundActive {
    self.viewRoundOver.hidden = YES;

    self.labelRound.text = [NSString stringWithFormat:@"Fråga %d:", [self.game getCurrentRound]];
    self.textQuestion.text = [self.game getQuestion];

    NSArray *answers = [self.game getAnswers];
    NSMutableArray *buttons = [@[self.buttonA, self.buttonB, self.buttonC, self.buttonD] mutableCopy];
    for (int i = 0; i < answers.count; i ++) {
        int button = arc4random() % buttons.count;
        [buttons[button] setTitle:answers[i] forState:UIControlStateNormal];
        [buttons removeObjectAtIndex:button];
    }
    self.viewRoundActive.hidden = NO;
}

- (void)displayRoundOver {
    self.viewRoundActive.hidden = YES;
    if ([self.game wasAnswerCorrect]) {
        self.labelResult.text = @"Du svarade rätt!";
        [self setAppTheme:[[ColorSet alloc]initGreen]];

    } else {
        self.labelResult.text = @"Du svarade fel!";
        [self setAppTheme:[[ColorSet alloc]initRed]];
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
    NSString *linebreaks = @"\n\n\n\n\n";
    if (self.game.roundsWon == self.game.gameLength) {
        gameCommentary = @"Bra jobbat!";
        gameResult = [NSString stringWithFormat:
                      @"Du svarade rätt på alla %d frågor.%@%@", self.game.gameLength, linebreaks, gameCommentary];
        [self setAppTheme:[[ColorSet alloc]initYellow]];
    } else if (self.game.roundsLost == self.game.gameLength) {
        gameCommentary = @"Kunde ha gått bättre...";
        gameResult = [NSString stringWithFormat:
                      @"Du svarade inte rätt på en enda fråga av %d möjliga.%@%@", self.game.gameLength, linebreaks, gameCommentary];
        [self setAppTheme:[[ColorSet alloc]initBrown]];
    } else {
        if (self.game.roundsWon > self.game.roundsLost) {
            gameCommentary = @"Bra jobbat!";
            [self setAppTheme:[[ColorSet alloc]initYellow]];
        } else {
            gameCommentary = @"Men du fick ju iallafall ett rätt!";
            [self setAppTheme:[[ColorSet alloc]initBrown]];
        }
        gameResult = [NSString stringWithFormat:
                      @"Du svarade rätt på %d frågor och fel på %d.%@%@",
                      self.game.roundsWon, self.game.roundsLost, linebreaks, gameCommentary];
    }
    self.textResult.text = gameResult;
    
    self.viewGameOver.hidden = NO;
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

- (void)setAppTheme:(ColorSet*)set {
    self.viewBackground.backgroundColor = set.background;
    self.viewIndentation.backgroundColor = set.foreground;
    
    self.labelRound.textColor = set.text;
    self.labelAnswer.textColor = set.text;
    self.labelResult.textColor = set.text;
    self.textQuestion.textColor = set.text;
    self.textResult.textColor = set.text;
    
    [self setButton:self.buttonA BG:set.button andText:set.buttonText andShadowColor:set.buttonTextShadow];
    [self setButton:self.buttonB BG:set.button andText:set.buttonText andShadowColor:set.buttonTextShadow];
    [self setButton:self.buttonC BG:set.button andText:set.buttonText andShadowColor:set.buttonTextShadow];
    [self setButton:self.buttonD BG:set.button andText:set.buttonText andShadowColor:set.buttonTextShadow];
    [self setButton:self.buttonNext BG:set.button andText:set.buttonText andShadowColor:set.buttonTextShadow];
    [self setButton:self.buttonRestart BG:set.button andText:set.buttonText andShadowColor:set.buttonTextShadow];
}

- (void)setButton:(UIButton*)btn BG:(UIColor*)bg andText:(UIColor*)txt andShadowColor:(UIColor*)shd {
    btn.backgroundColor = bg;
    [btn setTitleColor:txt forState:UIControlStateNormal];
    [btn setTitleShadowColor:shd forState:UIControlStateNormal];
}

@end
