//
//  KVOController.m
//  Modify
//
//  Created by Chiu Young on 2019/7/8.
//

#import "KVOController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface KVOController ()
@property (nonatomic, strong) Person * person1;
@property (nonatomic, strong) Person * person2;
@end

@implementation KVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setUp1];
//    [self setUp2];
    [self setUp3];

}

#pragma mark — ********************************* setUp1 *****************************
//- (void)setUp1{
//    self.person1 = [[Person alloc]init];
//    self.person2 = [[Person alloc]init];
//    self.person1.name = @"Chiu1";
//    self.person2.name = @"Chiu2";
//
//    //给person1对象添加KVO监听
//    NSKeyValueObservingOptions optionals = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//    //forKeyPath这里是属性名
//    [self.person1 addObserver:self forKeyPath:@"name" options:optionals context:@"CY"];
//
//}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.person1.name = @"Chiu3";
//    self.person2.name = @"Chiu4";
//}
//// 当监听对象的属性值发生改变时，就会调用
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//    CYLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
//}


#pragma mark — ********************************* setUp2 *****************************
- (void)setUp2{
    /*  只为person1添加了KVO  */
    self.person1 = [[Person alloc]init];
    self.person2 = [[Person alloc]init];
    self.person1.name = @"Chiu1";
    self.person2.name = @"Chiu2";
    
    CYLog(@"person监听之前 \n- %@ \n- %@",object_getClass(self.person1),object_getClass(self.person2));
    //    CYLog:
//    - Person
//    - Person
    
    //给person1对象添加KVO监听
    NSKeyValueObservingOptions optionals = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    //forKeyPath这里是属性名
    [self.person1 addObserver:self forKeyPath:@"name" options:optionals context:@"CY"];
    
    CYLog(@"person监听之后 \n- %@ \n- %@",object_getClass(self.person1),object_getClass(self.person2));
    //    CYLog:
//    - NSKVONotifying_Person
//    - Person

}


#pragma mark — ********************************* setUp3 *****************************
- (void)setUp3{
    self.person1 = [[Person alloc]init];
    self.person1.name = @"Chiu1";
    
    CYLog(@"添加KVO前内部方法");
    [self printMethodNamesofClass:object_getClass(self.person1)];
    //Person | name, setName:, .cxx_destruct, setAge:, age,
    
    NSKeyValueObservingOptions optionals = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    
    [self.person1 addObserver:self forKeyPath:@"name" options:optionals context:@"CY"];
    
    
    CYLog(@"添加KVO后内部方法");
    [self printMethodNamesofClass:object_getClass(self.person1)];
    //NSKVONotifying_Person | setName:, class, dealloc, _isKVOA,

}
#pragma mark — 总结
/*
 根据以上总结，我们大概猜到在使用KVO前后对象的改变了 未使用KVO监听的对象
 1、重写class方法是为了我们调用它的时候返回跟重写继承类之前同样的内容。KVO底层交换了 NSKVONotifying_Person 的 class 方法，让其返回 Person
 2、重写setter方法:在新的类中会重写对应的set方法，是为了在set方法中增加另外两个方法的调用
 */

#pragma mark — ********************************* 公有 *****************************
- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"name"];
}
//打印内部方法
- (void)printMethodNamesofClass:(Class)cls{
    unsigned int count;
    //方法列表
    Method * methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    // 打印方法名
    CYLog(@"%@ | %@", cls, methodNames);
}
@end
