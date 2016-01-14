//
//  SoundManager.h
//  PlayMe
//
//  Created by Jennifer Duffey on 1/13/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *audio;

+ (SoundManager *)sharedInstance;

- (void)playSound:(NSString *)soundKey;
- (void)pauseSound;
- (void)setVolume:(float)volume;

@end
