//
//  UserPresenterViewModel.h
//  EMAARDemoTest
//
//  Created by Parveen Khan on 19/05/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserPresenterViewModel : NSObject

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *dateOfJoining;
@property (nonatomic, strong) NSString *dateOfBirth;
@property (nonatomic, assign) NSString *age;
@property (nonatomic, strong) NSString *largeImageURL;
@property (nonatomic, strong) NSString *mediumImageURL;
@property (nonatomic, strong) NSString *thumbnailImageURL;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *postcode;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                 dateOfJoining:(NSString *)dateOfJoining
                    dateOfBirth:(NSString *)dateOfBirth
                            age:(NSString *)age
                  largeImageURL:(NSString *)largeImageURL
                 mediumImageURL:(NSString *)mediumImageURL
              thumbnailImageURL:(NSString *)thumbnailImageURL
                           city:(NSString *)city
                          state:(NSString *)state
                        country:(NSString *)country
                       postcode:(NSString *)postcode;

@end

NS_ASSUME_NONNULL_END
