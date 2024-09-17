//
//  main.m
//  hello-obj-c
//
//  Created by drypot on 2022/01/07.
//
//

#import <Foundation/Foundation.h>

void (^simpleBlock)(void) = ^{
    int *intPtr = NULL;

    NSLog(@"This is a block, %lu", sizeof(intPtr));
};

typedef int (^F)(int);

F getFunc(void) {

    int x = 10;
    int *px = &x;

    return ^ (int d){
        NSLog(@"x: %i", x);
        NSLog(@"*px: %i", *px);
        return *px;
    };
}

void blockDemo(void) {

    F func1 = getFunc();

    func1(3);

    @autoreleasepool {
        simpleBlock();
    }

}
