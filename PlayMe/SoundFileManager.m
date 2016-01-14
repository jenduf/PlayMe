//
//  SoundFileController.m
//  PlayMe
//
//  Created by Jennifer Duffey on 1/13/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import "SoundFileManager.h"

@implementation SoundFileManager

+ (SoundFileManager *)sharedInstance
{
    static dispatch_once_t pred;
    static SoundFileManager *sharedInstance = nil;
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
        self.sounds = [[NSMutableArray alloc] initWithArray:[self loadSoundFiles]];
    }
    
    return self;
}

- (NSArray *)loadSoundFiles
{
    NSString *pathName = [[NSBundle mainBundle] pathForResource:@"sounds" ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:pathName];
}

@end
