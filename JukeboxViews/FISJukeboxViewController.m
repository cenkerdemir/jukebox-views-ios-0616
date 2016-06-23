//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Cenker Demir on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"

@implementation FISJukeboxViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.playList = [[FISPlaylist alloc] init];
    self.trackList.text = self.playList.text;
}


- (IBAction)playButton:(UIButton *)sender {
    FISSong *songToPlay = [self.playList songForTrackNumber:self.trackNumber.text.integerValue];
    [self setUpAVAudioPlayerWithFileName:songToPlay.fileName];
    [self.audioPlayer play];
    NSLog(@"play button tapped for track# %lu", self.trackNumber.text.integerValue);
}


- (IBAction)stopButton:(UIButton *)sender {
    NSLog(@"stop button tapped for track# %lu", self.trackNumber.text.integerValue);
    [self.audioPlayer stop];
}

- (IBAction)sortTracksByTitle:(UIButton *)sender {
    [self.playList sortSongsByTitle];
    self.trackList.text = self.playList.text;
}

- (IBAction)sortTracksByArtist:(UIButton *)sender {
    [self.playList sortSongsByArtist];
    self.trackList.text = self.playList.text;
}

- (IBAction)sortTracksByAlbum:(UIButton *)sender {
    [self.playList sortSongsByAlbum];
    self.trackList.text = self.playList.text;
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer) {
        NSLog(@"Error in audioPlayer: %@", [error localizedDescription]);
    }
    else {
        [self.audioPlayer prepareToPlay];
    }
}

@end
