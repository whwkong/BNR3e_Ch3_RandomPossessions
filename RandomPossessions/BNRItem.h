//
//  BNRItem.h
//  RandomPossessionsCh2
//
//  Created by William Kong on 12/19/2013.
//  Copyright (c) 2013 William Kong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
}

+ (id) randomItem;

// the method's name (selector) is initWithItemName:valueInDollars:serialNumber:.
- (id) initWithItemName:(NSString *) name
         valueInDollars:(int) value
           serialNumber:(NSString *) sNumber;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;


@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;

@property (nonatomic) int valueInDollars;
@property (nonatomic, strong, readonly) NSDate *dateCreated;



@end
