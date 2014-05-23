//
//  QuestionDatabase.m
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import "QuestionDatabase.h"

@implementation QuestionDatabase

-(NSMutableArray *)questions
{
    if (!_questions) {
        _questions = [NSMutableArray array];
    }
    return _questions;
}

-(Question*) pickRandomQuestion
{
    Question *randomQuestion = nil;
	
	if ([self.questions count]) {
		unsigned index = arc4random() % [self.questions count];
		randomQuestion = self.questions[index];
		[self.questions removeObjectAtIndex:index];
	}
	
	return randomQuestion;
}

- (void)addQuestion:(Question *)question
{
	[self.questions addObject:question];
}


@end
