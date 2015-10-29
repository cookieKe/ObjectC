//
//  Deck.h
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#ifndef CardGame_Deck_h
#define CardGame_Deck_h
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


-(void)putCard:(Card*)card onTop:(BOOL)Top;
-(void)putCardOnTheTop:(Card*)card;

-(Card *)getTheRandomCard;


@end

#endif
