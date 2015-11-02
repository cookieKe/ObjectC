//
//  CardMatch.h
//  CardGame
//
//  Created by Kevin Zhu on 15/10/29.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayCard.h"
#import "Deck.h"

@interface CardMatch : NSObject
@property (readonly,nonatomic) NSInteger score;

-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck*)deck;

-(void)chooseCardAtIndex:(NSInteger)index;
-(Card*)cardAtIndex:(NSInteger)index;

@end
