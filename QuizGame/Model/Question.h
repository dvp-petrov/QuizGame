//
//  Question.h
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property(readonly) NSString *question;
@property(readonly) NSString *hintImage;

- (instancetype)initWithQuestion:(NSString *)question andAnswer:(NSString *)answer andHintImage:(NSString *)hintImage;

- (BOOL)isAnswerCorrect:(NSString *)answer;

@end
