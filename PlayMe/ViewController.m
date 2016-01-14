//
//  ViewController.m
//  PlayMe
//
//  Created by Jennifer Duffey on 1/13/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import "ViewController.h"
#import "SoundFileController.h"
#import "SoundManager.h"
#import "Constants.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *soundsTableView;

@property (nonatomic, strong) NSString *selectedSong;

@end

@implementation ViewController

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
    return [SoundFileController sharedInstance].sounds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SOUND_CELL_IDENTIFIER forIndexPath:indexPath];
    
    NSString *soundName = [SoundFileController sharedInstance].sounds[indexPath.row];
    cell.textLabel.text = soundName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedSong = [SoundFileController sharedInstance].sounds[indexPath.row];
    
    [self play:nil];
}

- (IBAction)play:(id)sender
{
    [[SoundManager sharedInstance] playSound:self.selectedSong];
}

- (IBAction)stop:(id)sender
{
    [[SoundManager sharedInstance] stopSounds];
}

@end
