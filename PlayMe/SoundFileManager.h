//
//  SoundFileController.h
//  PlayMe
//
//  Created by Jennifer Duffey on 1/13/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundFileManager : NSObject

+ (SoundFileManager *)sharedInstance;

@property (nonatomic, strong) NSMutableArray *sounds;

@end
