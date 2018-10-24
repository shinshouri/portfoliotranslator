//
//  ImageCell.m
//
//  Created by MC on 7/7/15.
//

#import "ImageCell.h"

@implementation ImageCell
@synthesize img, mainLabel, descriptionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        self.img = [[UIImageView alloc] initWithFrame:CGRectMake([self viewForBaselineLayout].frame.size.width-10, 20, 30, 30)];
        [[[self img] layer]setCornerRadius:5];
        [[self img] setClipsToBounds:YES];
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, [self viewForBaselineLayout].frame.size.width-50, 25)];
        self.mainLabel.textColor = [UIColor blackColor];
        self.mainLabel.font = [UIFont systemFontOfSize:20.0f];
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, [self viewForBaselineLayout].frame.size.width-50, 25)];
        self.descriptionLabel.textColor = [UIColor grayColor];
        self.descriptionLabel.font = [UIFont systemFontOfSize:18.0f];
        
        [self addSubview:self.img];
        [self addSubview:self.mainLabel];
        [self addSubview:self.descriptionLabel];
        
    }
    return self;
}

//- (void)awakeFromNib {
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
