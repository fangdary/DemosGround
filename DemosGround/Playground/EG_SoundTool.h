//
//  EG_SoundTool.h
//  DemosGround
//
//  Created by EG on 2017/5/3.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>
 #import <AudioToolbox/AudioToolbox.h>

@interface EG_SoundTool : NSObject

- (instancetype)initForPlayingVibrate;

- (instancetype)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type;

- (instancetype)initForPlayingSoundEffectWith:(NSString *)filename;

- (void)play;

@end
