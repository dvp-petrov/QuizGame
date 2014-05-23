//
//  Question.m
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import "Question.h"

@interface Question ()
@property(readwrite) NSString *question;
@property(readwrite) NSString *hintImage;
@property NSString *answer;
@end

@implementation Question

- (instancetype)initWithQuestion:(NSString *)question
                       andAnswer:(NSString *)answer
                    andHintImage:(NSString *)hintImage
{
    self = [super init];
    if (self) {
        
            self.question = question;
            self.answer = answer;
            self.hintImage = hintImage;

    }
    return self;
}

- (BOOL)isAnswerCorrect:(NSString *)answer
{
    
    if ([self.answer isEqualToString:[self deleteSpacesAndToLowercaseForText:answer]])
        return YES;
    return NO;
}

-(NSString *)deleteSpacesAndToLowercaseForText:(NSString*)text
{
    NSString *newText = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    newText = [newText lowercaseString];
    
    return newText;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.question];
}

@end
