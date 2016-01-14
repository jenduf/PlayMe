//
//  SoundManager.m
//  PlayMe
//
//  Created by Jennifer Duffey on 1/13/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import "SoundManager.h"
#import "SoundFileController.h"
#import <AVFoundation/AVFoundation.h>

@implementation SoundManager

+ (SoundManager *)sharedInstance
{
    static dispatch_once_t pred;
    static SoundManager *sharedInstance = nil;
    dispatch_once(&pred, ^
    {
        sharedInstance = [[self alloc] init];
                      
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self preloadSounds:[SoundFileController sharedInstance].sounds];
    }
    
    return self;
}

- (void)preloadSounds:(NSArray *)effectFileNames
{
    // initialize the effects array
    _audio = [NSMutableDictionary dictionaryWithCapacity:effectFileNames.count];
    
    // loop over the filenames
    for(NSString *effect in effectFileNames)
    {
        NSString *soundPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:effect];
        NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
        
        // load the file contents
        NSError *loadError = nil;
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&loadError];
        NSAssert(loadError==nil, @"load sound failed");
        
        // prepare to play
        player.numberOfLoops = 0;
        [player prepareToPlay];
        
        // add to the array
        _audio[effect] = player;
    }
}

- (void)playSound:(NSString *)soundKey
{
    NSAssert(self.audio[soundKey], @"effect not found");
    
    AVAudioPlayer *player = (AVAudioPlayer *)self.audio[soundKey];
    
    if(player.isPlaying)
    {
        player.currentTime = 0;
    }
    else
    {
        [player play];
    }
}

- (void)stopSounds
{
    [self.audio enumerateKeysAndObjectsUsingBlock:^(NSString *key, AVAudioPlayer *obj, BOOL *stop)
     {
         if(obj.isPlaying)
             [obj stop];
     }];
}

- (void)setVolume:(float)volume
{	
    [self.audio enumerateKeysAndObjectsUsingBlock:^(NSString *key, AVAudioPlayer *obj, BOOL *stop)
     {
         
         [obj setVolume:volume];
     }];
}


@end
