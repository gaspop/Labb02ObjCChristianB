//
//  ColorSet.h
//  QuizApp
//
//  Created by Christian Blomqvist on 2017-01-19.
//  Copyright © 2017 Christian Blomqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorSet : NSObject

@property (nonatomic, readonly) UIColor* background;
@property (nonatomic, readonly) UIColor* foreground;
@property (nonatomic, readonly) UIColor* text;
@property (nonatomic, readonly) UIColor* textShadow;
@property (nonatomic, readonly) UIColor* button;
@property (nonatomic, readonly) UIColor* buttonText;
@property (nonatomic, readonly) UIColor* buttonTextShadow;

- (instancetype)initRed;
- (instancetype)initGreen;
- (instancetype)initBlue;
- (instancetype)initYellow;
- (instancetype)initBrown;
+ (UIColor*)newColorR:(int)r G:(int)g B:(int)b;

@end
