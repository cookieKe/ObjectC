//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"
#import "PlayCard.h"
@implementation PlayingCardDeck

-(instancetype) init
{
    self =[super init];
    for (NSString *suit in [PlayCard ValidSuits]) {
        for (NSUInteger i=1; i<=[PlayCard MaxRank]; i++) {
            PlayCard* tempCard = [[PlayCard alloc] init];
            tempCard.suits = suit;
            tempCard.rank = i;
            [self putCardOnTheTop:tempCard];

        }
    }
    return self;
}

@end