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

@property (weak, nonatomic) IBOutlet UIView *test;
@property (weak, nonatomic) IBOutlet UITextView *textQuestion;
@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIButton *buttonD;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.game = [Game newGame];
    
    [self updateGame];
    
    //self.test.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateGame {
    [self.game newQuestion];
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
    
}

- (IBAction)pressButton:(UIButton*)sender {
    NSString* answer = sender.currentTitle;
    if ([self.game makeGuess:answer]) {
        [self updateGame];
    }
}


@end
