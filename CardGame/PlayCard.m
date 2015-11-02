//
//  PlayCard.m
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayCard.h"

@interface PlayCard()


@end

@implementation PlayCard
@synthesize rank = _rank;
@synthesize suits = _suits;

-(void)setSuits:(NSString *)suits
{
    _suits = ([[PlayCard ValidSuits] containsObject:suits])? suits :nil;
}

-(NSString*)suits
{
    return _suits ? _suits :nil;
}

-(NSString*)content
{
    return [[[PlayCard RankStrings] objectAtIndex:self.rank] stringByAppendingString:_suits];
}


+(NSArray*)ValidSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+(NSArray*)RankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)MaxRank
{
    return ([[PlayCard RankStrings] count]-1);
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [[PlayCard RankStrings] count]) {
        _rank = rank;
    }
}

-(int)match:(NSArray *)cardArray
{
    int score = 0;
    NSLog(@"go to match");
    for (PlayCard *card in cardArray) {
        if ([card.suits isEqualToString:self.suits]) {
            score+=4;
        }
        if (card.rank == self.rank) {
            score+=self.rank;
        }
    }
    NSLog(@" match score :%d",score);
    return score;
}

@end