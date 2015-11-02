//
//  CardMatch.m
//  CardGame
//
//  Created by Kevin Zhu on 15/10/29.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import "CardMatch.h"

#define MISMATCH_GRADE 4

@interface CardMatch()

@property (nonatomic,readwrite) NSInteger score;
@property (strong,nonatomic) NSMutableArray *cards;

@end

@implementation CardMatch

-(NSMutableArray*)cards
{
    if(!_cards)
        _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(void)setScore:(NSInteger)score
{
    _score = score;
}

-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i =0 ; i< count ; i++) {
            Card* tempCard = [deck getTheRandomCard];
            [self.cards addObject:tempCard];
        }
    }
    return self;
}

-(void)chooseCardAtIndex:(NSInteger)index
{
    Card *card = [self.cards objectAtIndex:index];
    NSLog(@"%s",card.isMatched?"Matched":"noMatch");
    if(card.isMatched)
    {
        card.isChoosed = false;
    }
    else
    {
        if (card.isChoosed) {
            card.isChoosed = false;
        }
        else
        {
        for (Card *otherCard in self.cards) {
            if(otherCard.isChoosed && !otherCard.isMatched)
            {
                NSLog(@"second card in");
                int matchScore = [card match:@[otherCard]];
                if(matchScore)
                {
                    self.score += matchScore;
                    card.isMatched=true;
                    otherCard.isMatched=true;
                }
                else
                {
                    self.score -= MISMATCH_GRADE;
                    otherCard.isChoosed=false;
                }
                break;
            }
        }
        card.isChoosed=true;
        }
    }
}

-(Card*)cardAtIndex:(NSInteger)index
{
    Card *card = (index < self.cards.count) ? [self.cards objectAtIndex:index]:nil;
    return card;
}


@end

