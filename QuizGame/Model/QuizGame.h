//
//  QuziGame.h
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import <Foundation/Foundation.h>
#import "CapitalQuestionDatabase.h"

@interface QuizGame : NSObject

@property(readonly, nonatomic) NSInteger score;

- (id)initWithQuestionCount:(NSUInteger) count
             UsingQuestions:(QuestionDatabase*) qDB;

-(Question *)nextQuestion;
-(Question *)currentQuestion;

-(void) updateScoreForAnswer:(NSString*) answer;

- (NSString*)descriptionEndGame;


@end
