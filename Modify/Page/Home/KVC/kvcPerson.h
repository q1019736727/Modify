//
//  kvcPerson.h
//  Modify
//
//  Created by Chiu Young on 2019/7/9.
//

#import <Foundation/Foundation.h>
#import "kvcStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface kvcPerson : NSObject
@property (nonatomic,assign) int age;
@property (nonatomic,strong) kvcStudent * stu;
@property (nonatomic,strong) NSMutableArray *list;
@end

NS_ASSUME_NONNULL_END
