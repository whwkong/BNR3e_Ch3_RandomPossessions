//
//  BNRItem.m
//  RandomPossessionsCh2
//
//  Created by William Kong on 12/19/2013.
//  Copyright (c) 2013 William Kong. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName;
@synthesize containedItem, container, serialNumber, valueInDollars, dateCreated;

+ (id) randomItem
{
    // create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                    @"Rusty",
                                    @"Shiny", nil];
                                    
    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                                                        @"Spork",
                                                        @"Mac",
                                                        nil];
    
    // Get index of random adjective/noun from the lists
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition for "unsigned long"
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList  objectAtIndex:nounIndex]];
    
    int randomValue = rand()%100;
    
    // generate random serial number
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0'+rand()%10,
                                    'A'+rand()%26,
                                    '0'+rand()%10,
                                    'A'+rand()%26,
                                    '0'+rand()%10];
   
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                        valueInDollars:randomValue
                                          serialNumber:randomSerialNumber];
    return newItem;
}

- (id) initWithItemName:(NSString *) name
         valueInDollars:(int) value
           serialNumber:(NSString *) sNumber
{
    // call superclass' designated initializer
    self = [super init];
    
    if (self) {
        // set the instance variables
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }
    
    // return address of new object
    return self;
}

- (id) init
{
    return [self initWithItemName:@"Item"
                 valueInDollars:0
                 serialNumber:@""];
}


- (void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}



- (void) setContainedItem:(BNRItem *)i
{
    containedItem = i;
    
    // when given an item to contain, the contained item
    // will be given a pointer to its container
    [i setContainer:self];
}


- (NSString*) description
{
    NSString *descriptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@) : Worth $%d, recorded on %@",
                            itemName,
                            serialNumber,
                            valueInDollars,
                            dateCreated];
    
    return descriptionString;
}



@end
