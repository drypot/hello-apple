#import <Foundation/Foundation.h>

void arrayDemo(void) {
    @autoreleasepool {
        NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:
                @"one", @"two", @"three", @"four", nil];
        NSMutableArray *dataArray2;

        // simple assignment
        dataArray2 = dataArray;
        [dataArray2 removeObjectAtIndex:0];

        for (NSString *elem in dataArray)
            NSLog(@" %@", elem); // two three four

        for (NSString * elem in dataArray2 )
             NSLog(@" %@", elem); // two three four

        // try a copy, then remove the first element from the copy
        dataArray2 = [dataArray mutableCopy];
        [dataArray2 removeObjectAtIndex:0];

        for (NSString *elem in dataArray)
            NSLog(@" %@", elem); // two three four

        for (NSString *elem in dataArray2)
            NSLog(@" %@", elem); // three four
    }
}
