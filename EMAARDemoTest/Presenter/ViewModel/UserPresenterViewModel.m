//
//  UserPresenterViewModel.m
//  EMAARDemoTest
//
//  Created by Parveen Khan on 19/05/23.
//

#import "UserPresenterViewModel.h"

@implementation UserPresenterViewModel

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
                       postcode:(NSString *)postcode {
    self = [super init];
    if (self) {
        NSString *fullName = [NSString stringWithFormat:@"%@ " " %@", firstName, lastName];
        _fullName = fullName;
        _email = email;
        _dateOfJoining = dateOfJoining;
        _dateOfBirth = dateOfBirth;
        _age = age;
        _largeImageURL = largeImageURL;
        _mediumImageURL = mediumImageURL;
        _thumbnailImageURL = thumbnailImageURL;
        _city = city;
        _state = state;
        _country = country;
        _postcode = postcode;
    }
    return self;
}

@end
