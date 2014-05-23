//
//  TeamRocketViewController.m
//  QuizGame
//
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//  Created by Dimitar Petrov, Dragomir Ivanov, Petya Dzhurdzheva and Radoslav Benin

#import "TeamRocketViewController.h"
#import "QuizGame.h"

#define QUESTION_COUNT 10

@interface TeamRocketViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextField *answer;
@property (weak, nonatomic) IBOutlet UIImageView *hintImage;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeImageRecogniser;
@property (strong) QuizGame *game;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;


@end

@implementation TeamRocketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self newGame];
    
    self.swipeImageRecogniser = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nexImageSwipe:)];
    self.swipeImageRecogniser.direction = UISwipeGestureRecognizerDirectionRight;
    [self.swipeImageRecogniser setNumberOfTouchesRequired:1];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)newGame
{
    self.game = [[QuizGame alloc] initWithQuestionCount:QUESTION_COUNT UsingQuestions:[[CapitalQuestionDatabase alloc] init]];
    [self updateScore];
    [self updateUI];
    [self toHideButtons:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextQuestionButton:(UIButton *)sender {
    [self.game nextQuestion];
    [self updateUI];
}

- (IBAction)nexImageSwipe:(UISwipeGestureRecognizer *)sender {
    [self updateUI];
}
- (IBAction)touchedSubmitButton:(UIButton *)sender {
    [self updateScore];
    [self toEnableButtons:NO];
}

- (void)updateUI
{
    Question* currentQuestion = [self.game currentQuestion];
    if (currentQuestion) {
        self.questionLabel.text = [NSString stringWithFormat:@"%@",currentQuestion.question];
        self.hintImage.image = [UIImage imageNamed:currentQuestion.hintImage];
        [self toEnableButtons:YES];
    }else{
        [self endGameUI];
    }
    self.answer.text = @"";
    [self.answer resignFirstResponder];
}

- (void)updateScore
{
    [self.game updateScoreForAnswer:self.answer.text];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d / %d",self.game.score, QUESTION_COUNT];
}

- (IBAction)touchedPlayAgainButton:(UIButton *)sender
{
    [self newGame];
}

- (void)endGameUI
{
    self.questionLabel.text = [self.game descriptionEndGame];
    self.hintImage.image = [UIImage imageNamed:@"endGame"];
    [self toHideButtons:YES];
}

- (void)toHideButtons:(BOOL)isHidden
{
    self.answer.hidden = isHidden;
    self.submitButton.hidden = isHidden;
    self.nextQuestionButton.hidden = isHidden;
    
    self.playAgainButton.hidden = !isHidden;
}

- (void)toEnableButtons:(BOOL)isEnabled
{
    self.submitButton.enabled = isEnabled;
    self.answer.enabled = isEnabled;
}
@end
