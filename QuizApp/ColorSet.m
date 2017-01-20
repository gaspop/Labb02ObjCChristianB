//
//  ColorSet.m
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-19.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import "ColorSet.h"

@implementation ColorSet

- (instancetype)initRed {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:229 G:115 B:115];
        _foreground = [ColorSet newColorR:255 G:235 B:238];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:244 G:67 B:54];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

- (instancetype)initGreen {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:139 G:195 B:74];
        _foreground = [ColorSet newColorR:220 G:237 B:200];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:85 G:139 B:47];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

- (instancetype)initBlue {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:121 G:134 B:203];
        _foreground = [ColorSet newColorR:232 G:234 B:246];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:63 G:81 B:181];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

- (instancetype)initLime {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:178 G:255 B:89];
        _foreground = [ColorSet newColorR:240 G:244 B:195];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:100 G:221 B:23];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

- (instancetype)initYellow {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:255 G:213 B:79];
        _foreground = [ColorSet newColorR:255 G:248 B:225];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:255 G:152 B:0];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

- (instancetype)initOrange {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:255 G:152 B:0];
        _foreground = [ColorSet newColorR:255 G:224 B:178];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:239 G:108 B:0];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

- (instancetype)initBrown {
    self = [super init];
    
    if (self) {
        _background = [ColorSet newColorR:93 G:64 B:55];
        _foreground = [ColorSet newColorR:188 G:170 B:164];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _text = [ColorSet newColorR:0 G:0 B:0];
        _button = [ColorSet newColorR:62 G:39 B:35];
        _buttonText = [ColorSet newColorR:255 G:255 B:255];
        _buttonTextShadow = [ColorSet newColorR:0 G:0 B:0];
    }
    return self;
}

+ (UIColor*)newColorR:(int)r G:(int)g B:(int)b {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha: 1.0];
}

@end
