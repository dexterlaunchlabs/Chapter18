//
//  BIDViewController.h
//  WhereIam
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface BIDViewController : UIViewController
@property (strong, nonatomic) CLLocationManager *locationManager; @property (strong, nonatomic) CLLocation *startingPoint;
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel; @property (strong, nonatomic) IBOutlet UILabel *horizontalAccuracyLabel; @property (strong, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *verticalAccuracyLabel; @property (strong, nonatomic) IBOutlet UILabel *distanceTraveledLabel;
@end

