//
//  main.m
//  RandomPossessionsCh2
//
//  Created by William Kong on 12/14/2013.
//  Copyright (c) 2013 William Kong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        // Send message addObject: to NSMutableArray pointed to
        // by variable items, passing a string each time
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        // send anoter message, insertObject:atIndex:, to same array object
        //
        // Note : that the first parameter takes type: id, which is essentially analogous
        // to a void* pointer.  That's because a mutable array can store objects of various
        // types.
        [items insertObject:@"Zero" atIndex:0];
        
        // for every item in the array, as determined by sending count to items
        for (int i=0; i < [items count]; ++i) {
            // we get the ith object from the array and pass it as an argument to NSLog,
            // which implicitly sends the description message to that object
            NSLog(@"%@", [items objectAtIndex:i]);
        }
        
        NSLog(@"items > %@", items);
        
        
        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];
        
       
        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];
        
        
        [backpack setContainedItem:calculator];
        
        
        backpack = nil;
        NSLog(@"+Container: %@", [calculator container]);
        
        calculator = nil;
    }
    return 0;
}


