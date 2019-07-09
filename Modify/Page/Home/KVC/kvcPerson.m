//
//  kvcPerson.m
//  Modify
//
//  Created by Chiu Young on 2019/7/9.
//

#import "kvcPerson.h"

@implementation kvcPerson
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.list = [NSMutableArray new];
    }
    return self;
}
@end
