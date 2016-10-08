//
//  StringHelper.m
//  CocoaTouchStaticLib
//
//  Created by richard on 2016/10/8.
//  Copyright © 2016年 richard. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper

-(NSString*)joinString:(NSString*)first second:(NSString*)second{
    return [NSString stringWithFormat:@"%@%@",first,second];
}

@end
