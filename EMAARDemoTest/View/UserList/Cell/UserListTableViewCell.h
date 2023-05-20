//
//  UserListTableViewCell.h
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserListTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *emailLabel;
@property (nonatomic, strong) UILabel *countryLabel;
@property (nonatomic, strong) UIImageView *accessoryImageView;
@property (nonatomic, strong) UILabel *loginStatus;

@end

NS_ASSUME_NONNULL_END
