//
//  ViewController.m
//  ZWKeychainExample
//
//  Created by Gavin on 17/3/30.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "ViewController.h"
#import "SAMKeychain+ZWExtensions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  NSArray *accounts = [SAMKeychain GetAllAccounts];
  for (NSString *account in accounts) {
    NSLog(@"account: %@",account);
  }
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
