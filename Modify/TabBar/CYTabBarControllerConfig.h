//
//  CYTabBarControllerConfig.h
//  Modify
//
//  Created by Chiu Yung on 2019/5/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CYTabBarControllerConfig : NSObject
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;
@end

NS_ASSUME_NONNULL_END
