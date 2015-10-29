//
//  Deck.m
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayCard.h"
@interface Deck()

@property (nonatomic) NSMutableArray * cardDeck;

@end

@implementation Deck

@synthesize cardDeck = _cardDeck;

-(NSArray*)cardDeck
{
    if (_cardDeck == nil) {
        _cardDeck = [[NSMutableArray alloc]init];
    }
    return _cardDeck;
}

-(void)putCard:(Card*)card onTop:(BOOL)Top
{
    if (Top) {
        [self.cardDeck insertObject:card atIndex:0];
    }
    else
    {
        [self.cardDeck  addObject:card];
    }
}

-(void)putCardOnTheTop:(Card *)card
{
    [self putCard:card onTop:true];
}

-(Card *)getTheRandomCard
{
    Card* tempCard = nil;
    
    if([_cardDeck count])
    {
        unsigned index = arc4random() % [self.cardDeck count];
        tempCard = _cardDeck[index];
        [_cardDeck removeObjectAtIndex:index];
    }
    
    return tempCard;
}

@end
