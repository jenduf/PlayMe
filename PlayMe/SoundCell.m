//
//  SoundCell.m
//  PlayMe
//
//  Created by Jennifer Duffey on 1/14/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

#import "SoundCell.h"

@implementation SoundCell

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleBlue;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
