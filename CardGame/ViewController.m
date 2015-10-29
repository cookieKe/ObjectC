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

@interface ViewController ()

@property (strong,nonatomic) PlayingCardDeck *pcd;
@property (strong,nonatomic) Deck *cDeck;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //object-c perfer property
    //_pcd = [[PlayingCardDeck alloc]init];
    //_cDeck = [[Deck alloc]init];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)flipCard:(UIButton*)sender {
    
    if (![[sender currentTitle] isEqualToString:@""]) {
        UIImage *image = [UIImage imageNamed:@"stanford"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        PlayCard *pc =(PlayCard*)[self.cDeck getTheRandomCard];
        [sender setBackgroundImage:nil forState:UIControlStateNormal];
        [sender setTitle:pc.content forState:UIControlStateNormal];
    }
}

@end
