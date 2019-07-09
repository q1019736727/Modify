//
//  kvcStudent.m
//  Modify
//
//  Created by Chiu Young on 2019/7/9.
//

#import "kvcStudent.h"

@implementation kvcStudent
//防止未找到对于的key或则value抛出异常
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    CYLog(@"没有找到key值");
}
- (void)setNilValueForKey:(NSString *)key {
    CYLog(@"没有传进vaule值");
}

@end
