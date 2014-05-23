//
//  QuziGame.m
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import "QuizGame.h"

@interface QuizGame ()

@property(readwrite) NSInteger score;
@property(nonatomic) NSMutableArray* quizQuestions;
@end

@implementation QuizGame

#define END_MESSAGE @"That's all,\n folks!"

//designated initializer
- (id)initWithQuestionCount:(NSUInteger) count UsingQuestions:(QuestionDatabase*) qDB
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Question* question = [qDB pickRandomQuestion];
            if (question) {
                [self.quizQuestions addObject:question];
            }
        }
    }
    return self;
}

- (NSMutableArray *)quizQuestions
{
    if (!_quizQuestions) {
        _quizQuestions = [NSMutableArray array];
    }
    return _quizQuestions;
}

-(Question*) nextQuestion {
    Question *question;
    if ([self.quizQuestions count]) {
        question = [self.quizQuestions lastObject];
        [self.quizQuestions removeObject:question];
    }
    return question;
}

-(Question *)currentQuestion
{
    return [self.quizQuestions lastObject];
    
}

-(void) updateScoreForAnswer:(NSString*) answer {
    if ([[self currentQuestion] isAnswerCorrect:answer]) {
        self.score++;
    }
}

- (NSString*)descriptionEndGame
{
    return [NSString stringWithFormat:END_MESSAGE];
}


@end
