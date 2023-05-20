//
//  UserListViewController.m
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

#import "UserListViewController.h"
#import "UserListTableViewCell.h"
#import "EMAARDemoTest-Swift.h"
#import "UserPresenterViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface UserListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UserListPresenterWrapper *presenterWrapper;
@property (nonatomic, strong) NSMutableArray<UserPresenterViewModel *> *usersList;
@property (nonatomic, assign) BOOL isLoading; // Flag to track if data is currently being loaded
@property (nonatomic, assign) NSInteger currentPage; // Current page
@property (nonatomic, assign) NSInteger totalPages; // Total pages

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Users List";
    self.usersList = [[NSMutableArray alloc] init];
    self.isLoading = NO;
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;

    [self.view addSubview:self.tableView];

    // Set up Auto Layout constraints
    NSLayoutConstraint *topConstraint = [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor];
    NSLayoutConstraint *leadingConstraint = [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *trailingConstraint = [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *bottomConstraint = [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
    [NSLayoutConstraint activateConstraints:@[topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]];

    [self.tableView registerClass:[UserListTableViewCell class] forCellReuseIdentifier:@"UserListTableViewCell"];
    
    self.presenterWrapper  = [[UserListPresenterWrapper alloc] initWithViewController:self];
    [self getUserList];
}


- (void)getUserList {
    self.isLoading = YES;
    self.currentPage = 3;
    self.totalPages = 100;
    
    [self.presenterWrapper getUserListWithPage: self.currentPage completion:^(NSArray<UserPresenterViewModel *> *userList) {
        [self.usersList removeAllObjects];
        [self.usersList addObjectsFromArray:userList];
        self.currentPage = 1;
        self.totalPages = self.totalPages;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            self.isLoading = NO;
        });
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usersList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserListTableViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UserListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserListTableViewCell"];
    }
    UserPresenterViewModel *user = _usersList[indexPath.row];
    
    cell.nameLabel.text = user.fullName;
    cell.emailLabel.text = user.email;
    cell.countryLabel.text = [self.presenterWrapper getCountryFormatedText: user.country];
    cell.loginStatus.text = [self.presenterWrapper getFormattedLoginStatusWithDateString:user.dateOfJoining];
    
    [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:user.thumbnailImageURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            NSLog(@"Error loading image from URL: %@", error);
        } else {
            //save image data in core data
        }
    }];
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenterWrapper showUserDetailScreenWithViewModel: self.usersList[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.usersList.count - 1 && !self.isLoading) {
        [self loadMoreUserData];
    }
}

- (void)loadMoreUserData {
    // Check if all pages have been loaded
    if (self.currentPage >= self.totalPages) {
        return;
    }
    
    // Simulate loading more user data from a network request
    self.isLoading = YES;
    
    // Make a network request to fetch user data for the next page
    NSInteger nextPage = self.currentPage + 1;
    
    [self.presenterWrapper getUserListWithPage:self.currentPage completion:^(NSArray<UserPresenterViewModel *> *userList) {
        [self.usersList addObjectsFromArray:userList];
        self.currentPage = nextPage;
        self.totalPages = self.totalPages;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            self.isLoading = NO;
        });
    }];
}



@end
