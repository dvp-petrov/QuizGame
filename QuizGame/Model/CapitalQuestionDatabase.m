//
//  CapitalQuestionDatabase.m
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import "CapitalQuestionDatabase.h"

@interface CapitalQuestionDatabase ()

@property(nonatomic,strong) NSArray* countries;
@property(nonatomic,strong) NSArray* capitals;

@end


@implementation CapitalQuestionDatabase

#define QUESTION_TEXT @"What is the capital of "


-(NSArray *)countries
{
    if (!_countries) {
        _countries = @[@"Austria",@"Azerbaijan", @"Belarus", @"Belgium", @"Croatia", @"Czech Republic", @"Denmark", @"Estonia", @"France", @"Germany", @"Greece", @"Hungary", @"Kazakhstan", @"Latvia", @"Norway", @"Poland", @"Romania", @"Spain", @"Turkey", @"Ukraine"];
    }
    
    return _countries;
}

-(NSArray *)capitals
{
    if (!_capitals) {
        _capitals = @[@"vienna", @"baku", @"minsk", @"brussels", @"zagreb", @"prague", @"copenhagen", @"tallinn", @"paris", @"berlin", @"athens", @"budapest", @"astana", @"riga", @"oslo", @"warsaw", @"bucharest", @"madrid", @"ankara", @"kiev"];
    }
    return _capitals;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i=0; i < [self.countries count]; i++) {
            NSString *questionText = [NSString stringWithFormat:@"%@%@?",QUESTION_TEXT,self.countries[i]];
            Question *question = [[Question alloc] initWithQuestion:questionText andAnswer:self.capitals[i] andHintImage:self.countries[i]];
            [self addQuestion:question];
        }
    }
    return self;
}

@end
