//
//  RutaViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/31/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "RutaViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import <AddressBook/AddressBook.h>
@interface RutaViewController ()

@end

@implementation RutaViewController

- (void)viewDidLoad {
    //NavigatrionDrawer
    self.navigationItem.title = @"RUTA";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: @"Kinik",
                              (NSString *)kABPersonAddressCityKey: @"Cancun",
                              (NSString *)kABPersonAddressStateKey: @"Quintana Roo",
                              (NSString *)kABPersonAddressZIPKey: @"7533"
                              };

    MKPlacemark *place = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(21.132893,-86.747208) addressDictionary:address];
    
   // [self.mapView addAnnotation:place];
    
    
    //self.mapitem = [[MKMapItem alloc] initWithPlacemark:place];
   // [self displayRegionCenteredOnMapItem: self.mapitem];
    
    
//    MKPlacemark *source = [[MKPlacemark   alloc]initWithCoordinate:CLLocationCoordinate2DMake(20.62811903364482,-87.07241714000702)   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:nil] ];
//    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
//    [srcMapItem setName:@""];
//    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(21.132893,-86.747208) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:nil] ];
//
//    
//    MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
//    [distMapItem setName:@""];
//    
//    [self findDirectionsFrom:srcMapItem to:distMapItem];
//    
    
    
//    MKPointAnnotation *_source = [[MKPointAnnotation   alloc] init ];
//    
//    _source.coordinate=CLLocationCoordinate2DMake(21.132893,-86.747208);
//    _source.title = @"Playa";
//    
//    MKPointAnnotation *_destination = [[MKPointAnnotation   alloc] init ];
//    
//    _destination.coordinate=CLLocationCoordinate2DMake(20.62811903364482,-87.07241714000702);
//    _destination.title = @"Playa";
//    
//    [self.mapView addAnnotation:_source];
//    [self.mapView addAnnotation:_destination];
    
    
    
    
    NSArray *_coordinates =[[NSArray alloc]init];
    _coordinates =  @[
                      @{
                          @"title":@"Merida",
                          @"coords":@"20.9627063, -89.6282379"
                          },
                      @{
                          @"title":@"Cancun",
                          @"coords":@"20.9578743, -86.9253269"
                          },
                      @{
                          @"title":@"Uman",
                          @"coords":@"20.9013842, -89.725542"
                          },
                      @{
                          @"title":@"HACIENDA YAXCOPOIL",
                          @"coords":@"20.74578, -89.7222305"
                          },
                      @{
                          @"title":@"CALKINÍ",
                          @"coords":@"20.3666355, -90.0485722"
                          },
                      @{
                          @"title":@"HECELCHAKAN",
                          @"coords":@"20.4593239, -89.7592358"
                          },
                      @{
                          @"title":@"POMUCH",
                          @"coords":@"20.1361321, -90.174441"
                          },
                      @{
                          @"title":@"CAMPECHE",
                          @"coords":@"19.8254249, -90.5548053"
                          },
                      @{
                          @"title":@"HOPELCHEN",
                          @"coords":@"19.7475659, -89.8427386"
                          },
                      @{
                          @"title":@"UXMAL",
                          @"coords":@"20.3888822, -89.6859027"
                          },
                      @{
                          @"title":@"MUNA",
                          @"coords":@"20.4886998,-89.7090447"
                          },
                      @{
                          @"title":@"TICUL",
                          @"coords":@"20.4098456,-89.5443497"
                          },
                      @{
                          @"title":@"MANI",
                          @"coords":@"21.2386449,-89.2108244"
                          },
                      @{
                          @"title":@"MAYAPAN",
                          @"coords":@"20.9790703,-89.5922433"
                          },
                      @{
                          @"title":@"DZIBILCHALTUN",
                          @"coords":@"21.0982572,-89.7417512"
                          },
                      @{
                          @"title":@"PROGRESO",
                          @"coords":@"21.2500219,-89.649646"
                          },
                      @{
                          @"title":@"Telchac Puerto",
                          @"coords":@"21.3274647,-89.2987983"
                          },
                      @{
                          @"title":@"xcambo",
                          @"coords":@"21.313508,-89.3541"
                          },
                      @{
                          @"title":@"Dzilam González",
                          @"coords":@"21.3294724,-89.0277729"
                          },
                      @{
                          @"title":@"Tizimín",
                          @"coords":@"21.0050939,-88.0464464"
                          },
                      @{
                          @"title":@"Chichén Itzá, Tinum, Yuc.",
                          @"coords":@"20.6875138,-88.5659138"
                          },
                      @{
                          @"title":@"Playa del Carmen",
                          @"coords":@"20.6335355,-87.0796316"
                          },
                      
                      
                      
                     ];
    
    CLLocationCoordinate2D points[[_coordinates count]];
    
    NSUInteger i = 0;
    for (NSDictionary *_coordDict in _coordinates) {
        NSString *_coordinateStr=_coordDict[@"coords"];
        NSArray *_coordParts = [_coordinateStr componentsSeparatedByString:@","];
        CLLocationCoordinate2D _coord = CLLocationCoordinate2DMake([_coordParts[0] floatValue], [_coordParts[1] floatValue]);
        points[i] = _coord;
        
        //agregamos marcadores en cada punto
        MKPointAnnotation *_destination = [[MKPointAnnotation   alloc] init ];
        _destination.coordinate=_coord;
        _destination.title=_coordDict[@"title"];
        [self.mapView addAnnotation:_destination];
        
        i++;
    }
    
    //Create custom polyline to draw overlay
    MKGeodesicPolyline *publicTransportPolyline = [MKGeodesicPolyline polylineWithCoordinates:points count:[_coordinates count]];
    //Add the polyline as overlay
    [self.mapView addOverlay: publicTransportPolyline level:MKOverlayLevelAboveRoads];
    
    
    
    
    
    
    
   // MKMapItem *_srcItem = [MKMapItem mapItemForCurrentLocation];
    //[self displayRegionCenteredOnMapItem: _srcItem];
 
}

- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
{
    //provide loading animation here
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = source;
    request.transportType = MKDirectionsTransportTypeAutomobile;
    request.destination = destination;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    __block typeof(self) weakSelf = self;
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         
         //stop loading animation here
         
         if (error) {
             NSLog(@"Error is %@",error);
         } else {
             //do something about the response, like draw it on map
             MKRoute *route = [response.routes firstObject];
             [self.mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
         }
     }];
}


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolylineRenderer *polylineRender = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    polylineRender.lineWidth = 3.0f;
    polylineRender.strokeColor = [UIColor blueColor];
    return polylineRender;
}
- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


- (void)displayRegionCenteredOnMapItem:(MKMapItem*)from {
    CLLocation* fromLocation = from.placemark.location;
    
    // Create a region centered on the starting point with a 10km span
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(fromLocation.coordinate, 10000, 10000);
    
    // Open the item in Maps, specifying the map region to display.
    [MKMapItem openMapsWithItems:[NSArray arrayWithObject:from]
                   launchOptions:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSValue valueWithMKCoordinate:region.center], MKLaunchOptionsMapCenterKey,
                                  [NSValue valueWithMKCoordinateSpan:region.span], MKLaunchOptionsMapSpanKey, nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
