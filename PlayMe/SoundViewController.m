//
//  ViewController.m
//  PlayMe
//
//  Created by Jennifer Duffey on 1/13/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import "SoundViewController.h"
#import "SoundFileManager.h"
#import "SoundManager.h"
#import "SoundCell.h"
#import "Constants.h"

@interface SoundViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *soundsTableView;
@property (nonatomic, weak) IBOutlet UIButton *muteButton;

@property (nonatomic, strong) NSString *selectedSong;

@end

@implementation SoundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.soundsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [SoundFileManager sharedInstance].sounds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SoundCell *cell = (SoundCell *)[tableView dequeueReusableCellWithIdentifier:SOUND_CELL_IDENTIFIER forIndexPath:indexPath];
    
    NSString *soundName = [SoundFileManager sharedInstance].sounds[indexPath.row];
    cell.soundName.text = soundName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedSong = [SoundFileManager sharedInstance].sounds[indexPath.row];
    
    [self play:nil];
}

- (IBAction)play:(id)sender
{
    if (self.selectedSong)
    {
        [[SoundManager sharedInstance] playSound:self.selectedSong];
    }
}

- (IBAction)pause:(id)sender
{
    [[SoundManager sharedInstance] pauseSound];
}

- (IBAction)mute:(id)sender
{
    if (self.muteButton.selected)
    {
        [[SoundManager sharedInstance] setVolume:1.0];
    }
    else
    {
        [[SoundManager sharedInstance] setVolume:0.0];
    }
    
    [self.muteButton setSelected:!self.muteButton.selected];
}

@end
