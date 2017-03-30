//
//  SAMKeychain+ZWExtensions.h
//  ZWKeychainExample
//
//  Created by Gavin on 17/3/30.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#if __has_include(<SAMKeychain/SAMKeychain.h>)
#import <SAMKeychain/SAMKeychain.h>
#else
#import "SAMKeychain.h"
#endif

@interface SAMKeychain (ZWExtensions)

+ (NSArray <NSString *> *)GetAllAccounts;
+ (NSArray <NSString *> *)GetAccountsForService:(NSString *)serviceName;

+ (void)deleteAllPassword;
+ (void)deleteAllPasswordForService:(NSString *)serviceName;

@end
