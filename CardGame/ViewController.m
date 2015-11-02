//
//  ViewController.m
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Deck.h"
#include "PlayCard.h"
#import "CardMatch.h"

@interface ViewController ()

@property (strong,nonatomic) PlayingCardDeck *pcd;
@property (strong,nonatomic) Deck *cDeck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *VisiableCard;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMatch* game;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //object-c perfer property
    //_pcd = [[PlayingCardDeck alloc]init];
    //_cDeck = [[Deck alloc]init];
}

-(CardMatch*)game
{
    if (!_game) {
        _game = [[CardMatch alloc] initWithCardCount:[self.VisiableCard count] usingDeck:self.cDeck];
    }
    return _game;
}
-(Deck*) cDeck
{
    if(!_cDeck)
        _cDeck = [self createDeck];
    return _cDeck;
}

-(Deck*)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

-(NSString*) realTitle:(Card*) card
{
    return card.isChoosed ? card.content : @"";
}

-(UIImage*) realBackGround:(Card*) card
{
    
    return [UIImage imageNamed:card.isChoosed?nil:@"stanford"];
}


-(void)updateUI
{
    for (UIButton* btn in self.VisiableCard) {
        //need a model to connect "Card" and UIButton
        int btnIndex = (int)[self.VisiableCard indexOfObject:btn];
        Card *tempCard = [self.game cardAtIndex:btnIndex];
        NSLog(@"%s",tempCard.isChoosed?"isChosed":"nochoose");
        NSLog(@"%@",[self realTitle:tempCard]);

        [btn setTitle:[self realTitle:tempCard] forState:UIControlStateNormal];
        [btn setBackgroundImage:[self realBackGround:tempCard] forState:UIControlStateNormal];
        btn.enabled = !tempCard.isMatched;
        if (!btn.enabled) {
            btn.alpha = 0.4;
        }
        NSLog(@"%s",tempCard.isMatched?"isMatched":"nomatch");
        NSLog(@"%s",btn.enabled?"isEnabled":"noEnable");

        self.scoreLabel.text = [NSString stringWithFormat:@"%ld",(long)self.game.score];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)flipCard:(UIButton*)sender {

    int chosenButtonIndex = (int)[self.VisiableCard indexOfObject:sender];
    NSLog(@"%d",chosenButtonIndex);
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
}

@end
