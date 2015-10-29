//
//  Card.m
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Card()

@end

@implementation Card

@synthesize content = content;
@synthesize isChoosed = isChosen;
@synthesize isMatched = Matched;

- (NSString *)content
{
    return content;
}

-(void)setContent:(NSString *)contents
{
    content = contents;
}

-(BOOL)isChosen
{
    return isChosen;
}

-(void)setIsChoosed:(BOOL)Chosen
{
    isChosen = Chosen;
}

-(BOOL)isMatched
{
    return Matched;
}

-(void)setIsMatched:(BOOL)Match
{
    Matched = Match;
}

-(int)match:(NSArray *)cardArray
{
    int score = 0;
    for(Card *card in cardArray)
    {
        if ([self.content isEqualToString:card.content]) {
            score++;
        }
    }
    return score;
}

@end
