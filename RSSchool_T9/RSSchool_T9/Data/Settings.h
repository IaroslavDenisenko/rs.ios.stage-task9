//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSObject

@property (nonatomic, copy) NSString *color;
@property (nonatomic, assign) BOOL isDrawing;

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
