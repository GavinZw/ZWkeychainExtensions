//
//  SAMKeychain+ZWExtensions.m
//  ZWKeychainExample
//
//  Created by Gavin on 17/3/30.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "SAMKeychain+ZWExtensions.h"

@implementation SAMKeychain (ZWExtensions)

#pragma mark -
#pragma mark - get account

+ (NSArray <NSString *> *)GetAllAccounts{
  return [self _accountForService:nil accountAll:YES];
}

+ (NSArray <NSString *> *)GetAccountsForService:(NSString *)serviceName{
  return [self _accountForService:serviceName accountAll:NO];
}

+ (NSArray *)_accountForService:(NSString *)service accountAll:(BOOL)allowAll{
  NSMutableArray *accounts = @[].mutableCopy;
  NSArray<NSDictionary<NSString *, id> *> *services = [SAMKeychain accountsForService:service];
  for (NSDictionary *item in services) {
    NSString *itemService = item[kSAMKeychainWhereKey];
    NSString *itemAccount = item[kSAMKeychainAccountKey];
    if (allowAll) {
      [accounts addObject:itemAccount];
    }
    else{
      if ([itemService isEqualToString:service]) {
        [accounts addObject:itemAccount];
      }
    }
  }
  return [accounts copy];
}

#pragma mark -
#pragma mark - delete

+ (void)deleteAllPasswordForService:(NSString *)serviceName{
  [self _deletePasswordForService:serviceName deleteAll:NO];
}

+ (void)deleteAllPassword{
  [self _deletePasswordForService:nil deleteAll:YES];
}

+ (void)_deletePasswordForService:(NSString *)service deleteAll:(BOOL)allowAll{
  NSArray<NSDictionary<NSString *, id> *> *services = [SAMKeychain accountsForService:service];
  for (NSDictionary *item in services) {
    NSString *itemService = item[kSAMKeychainWhereKey];
    NSString *itemAccount = item[kSAMKeychainAccountKey];
    if (allowAll) {
      [SAMKeychain deletePasswordForService:itemService account:itemAccount];
    }
    else{
      if ([itemService isEqualToString:service]) {
        [SAMKeychain deletePasswordForService:itemService account:itemAccount];
      }
    }
  }
}

@end
