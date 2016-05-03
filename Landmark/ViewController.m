//
//  ViewController.m
//  Landmark
//
//  Created by Demond Childers on 5/2/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Landmark.h"


@interface ViewController ()


@property (nonatomic, strong) AppDelegate            *appDelegate;
@property (nonatomic, strong) CLLocationManager      *locationMgr;
@property (nonatomic, strong) IBOutlet MKMapView     *landmarkMap;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray                *landmarkArray;
@property (nonatomic, weak)   IBOutlet  UITableView  *landmarkTableView;





@end

@implementation ViewController

#pragma mark - Map View Methods


-(void)zoomToPins {
    [_landmarkMap showAnnotations:[_landmarkMap annotations] animated:true];
    
}

-(void)zoomToLocationWithLat:(float)latitude andLon: (float)longitude andDiam: (float)diameter {
    if (latitude == 0 && longitude == 0) {
        NSLog(@"You gave me data");
    } else {
        CLLocationCoordinate2D zoomLoc = CLLocationCoordinate2DMake(latitude, longitude);
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLoc, diameter, diameter);
        MKCoordinateRegion adjustedRegion = [_landmarkMap regionThatFits:viewRegion];
        [_landmarkMap setRegion:adjustedRegion animated:true];
        
    }
    
}





-(void)annotateMapLocations {
    // REMOVE PINS
    NSMutableArray *pinsToRemove = [[NSMutableArray alloc] init];
    for (id  <MKAnnotation> annot in [_landmarkMap annotations]) {
        if ([annot isKindOfClass:[MKPointAnnotation class]]) {
            [pinsToRemove addObject:annot];
            
        }
    }
    
    [_landmarkMap removeAnnotations:pinsToRemove];
    
    // ADD PINS
    NSLog(@"About to display: %li",_landmarkArray.count);
    for (Landmark *currentLandmark in _landmarkArray) {
        MKPointAnnotation *pa1 = [[MKPointAnnotation alloc] init];
        pa1.coordinate = CLLocationCoordinate2DMake([currentLandmark.landLatitude floatValue], [currentLandmark.landLongitude floatValue]);
        pa1.title = currentLandmark.landName;
        pa1.subtitle = currentLandmark.landAddress;
        [_landmarkMap addAnnotation:pa1];
    }
    
    [self zoomToPins];
    
    
    
}

- (void) tempAddRecords {
    Landmark *pa1 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa1.landLatitude = @"42.339022";
    pa1.landLongitude = @"-83.048455";
    pa1.landName = @"Comerica Park";
    pa1.landDescription =@"Detroit Tigers Baseball Stadium";
    pa1.landAddress =@"2100 Woodward Ave, Detroit, MI 48201";
    pa1.landPhoneNumber = @"313-962-4000";
    pa1.landImageName=@" ";
    pa1.landURL=@"detroit.tigers.mlb.com";
    
    
    Landmark *pa2 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa2.landLatitude = @"42.325190";
    pa2.landLongitude = @"-83.051418";
    pa2.landName = @"Joe Louis Arena";
    pa2.landDescription = @"Red Wings Hockey";
    pa2.landAddress = @"19 Steve Yzerman Dr, Detroit, MI 48226";
    pa2.landPhoneNumber=@"313-471-7000";
    pa2.landImageName=@" ";
    pa2.landURL=@"joelouisarena.org";
    
    Landmark *pa3 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa3.landLatitude = @"42.326839";
    pa3.landLongitude = @"-83.049491";
    pa3.landName = @"Cobo Center";
    pa3.landDescription = @"Convention Center";
    pa3.landAddress = @"1 Washington Blvd, Detroit, MI 48226";
    pa3.landPhoneNumber=@"313-877-8777";
    pa3.landImageName=@" ";
    pa3.landURL=@"cobocenter.com";
    
    Landmark *pa4 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa4.landLatitude = @"42.331559";
    pa4.landLongitude = @"-83.048664";
    pa4.landName = @"American Coney Island";
    pa4.landDescription = @"Historic Restaurant";
    pa4.landAddress = @"114 W Lafayette Blvd, Detroit, MI 48226";
    pa4.landPhoneNumber=@"313-961-7758";
    pa4.landImageName=@" ";
    pa4.landURL=@"americanconeyisland.com";
    
    Landmark *pa5 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa5.landLatitude = @"42.336612";
    pa5.landLongitude = @"-83.048717";
    pa5.landName = @"Detroit Opera House";
    pa5.landDescription = @"Classic Concert Theatre";
    pa5.landAddress = @"1526 Broadway St, Detroit, MI 48226";
    pa5.landPhoneNumber=@"313-237-7464";
    pa5.landImageName=@" ";
    pa5.landURL=@"michiganopera.org";

    Landmark *pa6 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa6.landLatitude = @"42.340030";
    pa6.landLongitude = @"-83.045603";
    pa6.landName = @"Ford Field";
    pa6.landDescription = @"Detroit Lions Football";
    pa6.landAddress = @"2000 Brush St, Detroit, MI 48226";
    pa6.landPhoneNumber=@"313-262-2000 ";
    pa6.landImageName=@" ";
    pa6.landURL=@"detroitlions.com";
    
    Landmark *pa7 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa7.landLatitude = @"42.336690";
    pa7.landLongitude = @"-82.985286";
    pa7.landName = @"Belle Isle Aquarium";
    pa7.landDescription = @"Aquatic Center";
    pa7.landAddress = @"900 Inselruhe Ave, Detroit, MI 48207";
    pa7.landPhoneNumber=@"313-334-7052";
    pa7.landImageName=@" ";
    pa7.landURL=@"detroitaquarium.weebly.com";
    
    Landmark *pa8 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa8.landLatitude = @"42.329439";
    pa8.landLongitude = @"-83.039688";
    pa8.landName = @"Renaissance Center";
    pa8.landDescription = @"GM World Headquarters";
    pa8.landAddress = @"100 Renaissance Center, Detroit, MI 48243";
    pa8.landPhoneNumber=@"313-567-3126";
    pa8.landImageName=@" ";
    pa8.landURL=@"gmrencen.com";
    
    Landmark *pa9 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa9.landLatitude = @"42.338548";
    pa9.landLongitude = @"-83.052731";
    pa9.landName = @"Fox Theatre";
    pa9.landDescription = @"Entertainment Complex";
    pa9.landAddress = @"2211 Woodward Ave, Detroit, MI 48201";
    pa9.landPhoneNumber=@"313-471-3200 ";
    pa9.landImageName=@" ";
    pa9.landURL=@"olympiaentertainment.com";
    
    Landmark *pa10 =(Landmark *)[NSEntityDescription insertNewObjectForEntityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    pa10.landLatitude = @"42.334514";
    pa10.landLongitude = @"-83.041271";
    pa10.landName = @"Greektown Casino";
    pa10.landDescription =@"Casino/Hotel/NightLife";
    pa10.landAddress = @"555 E Lafayette St, Detroit, MI 48226";
    pa10.landPhoneNumber=@"313-223-2999";
    pa10.landImageName=@" ";
    pa10.landURL=@"greektowncasino.com";
    


    
    [_appDelegate saveContext];
    
}


//FETCH RECORDS

-(NSArray *)fetchItems {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Landmark" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:fetchRequest error:& error];
    return fetchResults;
    
}


#pragma mark - Location Methods



//
//    -(void)setupLocationMonitoring {
//        _locationMgr = [[CLLocationManager alloc] init];
//        _locationMgr.delegate = self;
//        _locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
//
//        if ([CLLocationManager locationServicesEnabled]) {
//            NSLog(@"Loc Svs Enabled");
//            switch ([CLLocationManager authorizationStatus]) {
//                case kCLAuthorizationStatusAuthorizedAlways:
//                    [self turnOnLocationMonitoring];
//                    break;
//                case  kCLAuthorizationStatusAuthorizedWhenInUse:
//                    [self turnOnLocationMonitoring];
//                    break;
//                case kCLAuthorizationStatusDenied:
//                    NSLog(@"Hey Turn Us Back on!");
//                    break;
//                case kCLAuthorizationStatusNotDetermined:
//                    if ([_locationMgr respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
//
//                        [_locationMgr requestWhenInUseAuthorization];
//                    }
//                    break;
//                case kCLAuthorizationStatusRestricted:
//                    NSLog(@"Hey Turn Us Back On!");
//                default:
//                    break;
//            }
//        } else {
//            NSLog(@"Turn it on Location Services in Settings!");
//        }
//
//
//    }



#pragma mark - Life Cycle Mehods



- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = [[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    [self tempAddRecords];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //        [self setupLocationMonitoring];
    _landmarkArray = [self fetchItems];
    NSLog(@"Count: %li",_landmarkArray.count);
    [self annotateMapLocations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
