//
//  BIDViewController.m
//  WhereIam
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize locationManager; @synthesize startingPoint; @synthesize latitudeLabel; @synthesize longitudeLabel; @synthesize horizontalAccuracyLabel; @synthesize altitudeLabel; @synthesize verticalAccuracyLabel; @synthesize distanceTraveledLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];

}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
    self.locationManager = nil;
    self.latitudeLabel = nil;
    self.longitudeLabel = nil; self.horizontalAccuracyLabel = nil; self.altitudeLabel = nil; self.verticalAccuracyLabel = nil; self.distanceTraveledLabel= nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    if (startingPoint == nil) self.startingPoint = newLocation;
    NSString *latitudeString = [NSString stringWithFormat:@"%g\u00B0", newLocation.coordinate.latitude];
    latitudeLabel.text = latitudeString;
    NSString *longitudeString = [NSString stringWithFormat:@"%g\u00B0", newLocation.coordinate.longitude];
    longitudeLabel.text = longitudeString;
    NSString *horizontalAccuracyString = [NSString stringWithFormat:@"%gm", newLocation.horizontalAccuracy];
    horizontalAccuracyLabel.text = horizontalAccuracyString;
    NSString *altitudeString = [NSString stringWithFormat:@"%gm", newLocation.altitude];
    altitudeLabel.text = altitudeString;
    NSString *verticalAccuracyString = [NSString stringWithFormat:@"%gm", newLocation.verticalAccuracy];
    verticalAccuracyLabel.text = verticalAccuracyString;
    CLLocationDistance distance = [newLocation distanceFromLocation:startingPoint];
    NSString *distanceString = [NSString stringWithFormat:@"%gm", distance];
    distanceTraveledLabel.text = distanceString;
}
    - (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
        NSString *errorType = (error.code == kCLErrorDenied) ? @"Access Denied" : @"Unknown Error";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting Location"
                              message:errorType delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show]; }
@end
