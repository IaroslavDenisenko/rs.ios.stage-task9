//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "Settings.h"

@implementation Settings

+ (instancetype)shared {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = @"#F3AF22";
        _isDrawing = true;
    }
    return self;
}


@end
