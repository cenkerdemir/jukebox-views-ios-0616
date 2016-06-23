//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Cenker Demir on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FISPlaylist.h"

@interface FISJukeboxViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *trackNumber;
@property (weak, nonatomic) IBOutlet UITextView *trackList;
@property (nonatomic) FISPlaylist *playList;
@property (nonatomic) AVAudioPlayer *audioPlayer;

@end
