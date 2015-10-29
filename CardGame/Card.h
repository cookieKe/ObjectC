//
//  Card.h
//  CardGame
//
//  Created by Kevin Zhu on 15/10/25.
//  Copyright (c) 2015年 Kevin Zhu. All rights reserved.
//

#ifndef CardGame_Card_h
#define CardGame_Card_h
#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *content;
@property (nonatomic,getter=isChosen) BOOL isChoosed;
@property (nonatomic,getter=isMatched) BOOL isMatched;

-(int)match:(NSArray *)cardArray;

@end
#endif
