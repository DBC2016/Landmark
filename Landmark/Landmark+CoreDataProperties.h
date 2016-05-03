//
//  Landmark+CoreDataProperties.h
//  Landmark
//
//  Created by Demond Childers on 5/2/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Landmark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Landmark (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *landAddress;
@property (nullable, nonatomic, retain) NSString *landLatitude;
@property (nullable, nonatomic, retain) NSString *landLongitude;
@property (nullable, nonatomic, retain) NSString *landPhoneNumber;
@property (nullable, nonatomic, retain) NSString *landName;
@property (nullable, nonatomic, retain) NSString *landImageName;
@property (nullable, nonatomic, retain) NSString *landURL;
@property (nullable, nonatomic, retain) NSString *landDescription;


@end

NS_ASSUME_NONNULL_END
