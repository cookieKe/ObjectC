//
//  Header.h
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#ifndef CardGame_Header_h
#define CardGame_Header_h
#import "Card.h"

@interface PlayCard : Card

@property (nonatomic,strong) NSString* suits;
@property (nonatomic) NSUInteger rank;

+ (NSArray*)ValidSuits;
+ (NSUInteger)MaxRank;

@end

#endif
