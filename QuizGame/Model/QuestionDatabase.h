//
//  QuestionDatabase.h
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionDatabase : NSObject

@property(nonatomic) NSMutableArray* questions;

-(Question*) pickRandomQuestion;
- (void)addQuestion:(Question *)question;

@end
