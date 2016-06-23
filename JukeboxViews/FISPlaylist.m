//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Cenker Demir on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@interface FISPlaylist ()



@end

@implementation FISPlaylist

- (instancetype)init {
    self = [super init];
    
    if(self) {
        _songs = [self generateSongObjects];
        _text = [self generateTextWithSongList];
    }
    return self;
}


- (void)sortSongsByTitle {
    NSSortDescriptor *sortDescByTitleAsc = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *sortDescByArtistAsc = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortDescByTitleAsc, sortDescByArtistAsc]];
    self.text = [self generateTextWithSongList];
}

- (void)sortSongsByArtist {
    NSSortDescriptor *sortDescByArtistAsc = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSSortDescriptor *sortDescByAlbumAsc = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortDescByArtistAsc , sortDescByAlbumAsc]];
    self.text = [self generateTextWithSongList];
}

- (void)sortSongsByAlbum {
    NSSortDescriptor *sortDescByAlbumAsc = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSSortDescriptor *sortDescByTitleAsc = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortDescByAlbumAsc, sortDescByTitleAsc]];
    self.text = [self generateTextWithSongList];
}

- (FISSong *)songForTrackNumber:(NSUInteger)number {
    if (number > 0 && number <= [self.songs count]) {
        return [self.songs objectAtIndex:number-1];
    }
    return nil;
}

- (NSMutableArray *)generateSongObjects
{
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    return songs;
}

- (NSString *)generateTextWithSongList {
    NSString *songInfo = @"";
    for (NSUInteger i=0; i < [self.songs count]; i++) {
       songInfo =  [songInfo stringByAppendingString:[NSString stringWithFormat:@"%lu. (Title) %@ (Artist) %@ (Album) %@\n",i+1,[[self.songs objectAtIndex:i] title] , [[self.songs objectAtIndex:i] artist], [[self.songs objectAtIndex:i] album]]];
    }
    return songInfo;
}

@end
