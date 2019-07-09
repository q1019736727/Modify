//
//  KVCController.m
//  Modify
//
//  Created by Chiu Young on 2019/7/9.
//

#import "KVCController.h"
#import "kvcPerson.h"
#import "kvcStudent.h"

@interface KVCController ()

@end

@implementation KVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//        kvcPerson *p = [[kvcPerson alloc]init];
//        p.stu = [[kvcStudent alloc]init];
//        [p setValue:@180 forKeyPath:@"stu.height"];
//        CYLog(@"valueForKey:%@",[p valueForKeyPath:@"stu.height"]);
//        CYLog(@"stu.height:%f",p.stu.height);
    
//    kvcPerson *p = [[kvcPerson alloc]init];
//    [[p mutableArrayValueForKey:@"list"] addObject:@"test"];
//    CYLog(@"mutableArrayValueForKey:%@",[p valueForKeyPath:@"list"]);
//    CYLog(@"%@",p.list);
    
    //异常处理
    kvcStudent *stu = [[kvcStudent alloc]init];
    [stu setValue:@"12304672587213" forKey:@"number"];
    [stu setValue:nil forKey:@"age"];

    
}



@end
