//
//  UserListTableViewCell.m
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

#import "UserListTableViewCell.h"

@implementation UserListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialize and configure the subviews
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _leftImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_leftImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_nameLabel];
        
        _emailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _emailLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_emailLabel];
        
        _countryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _countryLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _countryLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_countryLabel];
        
        _accessoryImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _accessoryImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _accessoryImageView.tintColor = UIColor.grayColor;
        _accessoryImageView.image = [UIImage imageNamed:@"rightIcon"];

        [self.contentView addSubview:_accessoryImageView];
        
        // Create and configure the text label
        self.loginStatus = [[UILabel alloc] initWithFrame:CGRectZero];
        self.loginStatus.translatesAutoresizingMaskIntoConstraints = NO;
        self.loginStatus.textColor = [UIColor darkGrayColor];
        _loginStatus.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.loginStatus];
        
        // Configure the appearance and layout constraints
        [NSLayoutConstraint activateConstraints:@[
            // Left Image View constraints
            [_leftImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8],
            [_leftImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [_leftImageView.widthAnchor constraintEqualToConstant:40],
            [_leftImageView.heightAnchor constraintEqualToConstant:40],
            
            // Accessory Image View constraints
            [_accessoryImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
            [_accessoryImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
            [_accessoryImageView.widthAnchor constraintEqualToConstant:20],
            [_accessoryImageView.heightAnchor constraintEqualToConstant:20],
            
            [self.loginStatus.trailingAnchor constraintEqualToAnchor: _accessoryImageView.leadingAnchor constant: -8],
            [self.loginStatus.centerYAnchor constraintEqualToAnchor:_accessoryImageView.centerYAnchor],
            
            
            // Name Label constraints
            [_nameLabel.leadingAnchor constraintEqualToAnchor:_leftImageView.trailingAnchor constant:8],
            [_nameLabel.topAnchor constraintEqualToAnchor:_loginStatus.bottomAnchor constant:0],
            [_nameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
            
            // Email Label constraints
            [_emailLabel.leadingAnchor constraintEqualToAnchor:_nameLabel.leadingAnchor],
            [_emailLabel.topAnchor constraintEqualToAnchor:_nameLabel.bottomAnchor constant:4],
            [_emailLabel.trailingAnchor constraintEqualToAnchor:_nameLabel.trailingAnchor],
            
            // Country Label constraints
            [_countryLabel.leadingAnchor constraintEqualToAnchor:_nameLabel.leadingAnchor],
            [_countryLabel.topAnchor constraintEqualToAnchor:_emailLabel.bottomAnchor constant:4],
            [_countryLabel.trailingAnchor constraintEqualToAnchor:_nameLabel.trailingAnchor]
        ]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];
}

@end
