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
@import CoreLocation;
@interface RutaViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation RutaViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    //NavigatrionDrawer
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
 
    
    self.mapView.showsUserLocation = YES;
    self.navigationItem.title = @"RUTA";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
  

    
    
    
    NSArray *_coordinates =[[NSArray alloc]init];
    _coordinates =  @[
                      //A-B
                      @{
                          @"title":@"Mérida",
                          @"coords":@"21.032591, -89.629652",
                          @"showMarker":@true
                          },
                      
                      
                      @{
                          @"title":@"Merida",
                          @"coords":@"21.030547, -89.633892"
                          },
                      @{
                          @"title":@"Merida",
                          @"coords":@"21.034661, -89.654309"
                          },
                      @{
                          @"title":@"Umán",
                          @"coords":@"20.881648, -89.748006",
                          @"showMarker":@true
                          },
                     
                      @{
                          @"title":@"Hacienda Yaxcopoil",
                          @"coords":@"20.743058, -89.715522",
                          
                          },
                      @{
                          @"title":@"Muna",
                          @"coords":@"20.486824, -89.713388",
                          @"showMarker":@true
                          },
                      @{
                          @"title":@"Bécal",
                          @"coords":@"20.441434, -90.027737",
                          @"showMarker":@true
                          },
                      @{
                          @"title":@"",
                          @"coords":@"20.237072, -90.093613"
                          },
                      @{
                          @"title":@"Pomuch",
                          @"coords":@"20.129829, -90.1695713"
                          },
                      
                      
                      @{
                          @"title":@"Campeche",
                          @"coords":@"19.836682, -90.551432",
                          @"showMarker":@true
                          },
                      
                      
                      
                     //B-C
                      @{
                          @"title":@"Campeche",
                          @"coords":@"19.844005, -90.541094"
                          },
                      @{
                          @"title":@"Campeche2",
                          @"coords":@"19.844847, -90.485110"
                          },
                      
                      @{
                          @"title":@"Holpechen",
                          @"coords":@"19.747334, -89.844123",
                          @"showMarker":@true
                          },
                      
                      @{
                          @"title":@"Santa Rosa Xtampak",
                          @"coords":@"19.775156, -89.596288",
                          @"showMarker":@true
                          },
//                      @{
//                          @"title":@"Grutas de Xtacumbilxunaan",
//                          @"coords":@"20.006424, -89.842898",
//                          @"showMarker":@true
//                          },
                      @{
                          @"title":@"Uxmal",
                          @"coords":@"20.360130, -89.769430",
                          @"showMarker":@true
                          },
                      
                      
                      //C-D
                      
                      @{
                          @"title":@"Santa Elena",
                          @"coords":@"20.325754, -89.641965"
                          },
//                      @{
//                          @"title":@"Ticul",
//                          @"coords":@"20.395289, -89.540020",
//                          @"showMarker":@true
//                          },
//                      @{
//                          @"title":@"Ticul",
//                          @"coords":@"20.397859, -89.535846"
//                          },
//                      
//                      @{
//                          @"title":@"Ticul",
//                          @"coords":@"20.397248, -89.535449"
//                          },
                      @{
                          @"title":@"Maní",
                          @"coords":@"20.386730, -89.392054",
                          @"showMarker":@true
                          },
                      @{
                          @"title":@"Maní",
                          @"coords":@"20.415267, -89.342106",
                          
                          },
                      
                      @{
                          @"title":@"Z. A. Mayapan",
                          @"coords":@"20.632594, -89.458469",
                          @"showMarker":@true
                          },
                      @{
                          @"title":@"Acanceh",
                          @"coords":@"20.813236, -89.453061",
                          
                          },
                      @{
                          @"title":@"Mérida",
                          @"coords":@"20.986008, -89.619788",
                          @"showMarker":@true
                          },
                      

                      @{
                          @"title":@"Progreso",
                          @"coords":@"21.285345, -89.661917",
                          },
                      @{
                          @"title":@"Z. A. Xcambo",
                          @"coords":@"21.314082, -89.353918",
                          @"showMarker":@true
                          },
                      
                      
                      //D-E
                     
                      @{
                          @"title":@"",
                          @"coords":@"21.393030, -88.891646"
                          },
                      @{
                          @"title":@"Dzilam Gonzalez",
                          @"coords":@"21.280829, -88.928671",
                           @"showMarker":@true
                          },
//                      @{
//                          @"title":@"Dzidzantun",
//                          @"coords":@"21.241901, -89.046411",
//                           @"showMarker":@true
//                          },
//                      @{
//                          @"title":@"",
//                          @"coords":@"21.141256, -89.111939"
//                          },
//                      @{
//                          @"title":@"",
//                          @"coords":@"21.198097, -88.810170"
//                          },
//                      @{
//                          @"title":@"",
//                          @"coords":@"21.152583, -88.171573"
//                          
//                          },
                      @{
                          @"title":@"Tizimin",
                          @"coords":@"21.140176, -88.163162",
                          @"showMarker":@true
                          
                          },
                      @{
                          @"title":@"",
                          @"coords":@"20.742540, -88.212842"
                          },
                      
                      //E-F
                      @{
                          @"title":@"Chichen Itzá",
                          @"coords":@"20.677660,-88.568201",
                           @"showMarker":@true
                          },
                      @{
                          @"title":@"Valladolid",
                          @"coords":@"20.689625, -88.201762",
                          @"showMarker":@true
                          },
                      @{
                          @"title":@"",
                          @"coords":@"20.691899, -88.203566"
                          },
                      @{
                          @"title":@"",
                          @"coords":@"20.703302, -88.202590"
                          },
                      @{
                          @"title":@"Playa del Carmen",
                          @"coords":@"20.634971, -87.078022",
                          @"showMarker":@true
                          },
                      
                      @{
                          @"title":@"Grand Oasis Cancún",
                          @"coords":@"21.086005, -86.773757",
                           @"showMarker":@true
                          },
                      
                      
                      
                      
                      
                     ];
    
    
        MKPlacemark *p1 = [[MKPlacemark   alloc]initWithCoordinate:CLLocationCoordinate2DMake(20.0,-88.704814)   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:nil] ];
    
    
    

    MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(p1.coordinate, 750000, 750000);
    [self.mapView setRegion: [self.mapView regionThatFits:reg] animated:YES];
    
    
    
    
    
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
        
        if (_coordDict[@"showMarker"]) {
            [self.mapView addAnnotation:_destination];
        }

        
        //agregamos los placemarks y los mapitems para trazar la ruta
        if(i>0){
        MKPlacemark *start = [[MKPlacemark   alloc]initWithCoordinate:points[i-1]   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:nil] ];
        MKMapItem *startMapItem = [[MKMapItem alloc]initWithPlacemark:start];
        [startMapItem setName:@""];
        
        MKPlacemark *end = [[MKPlacemark   alloc]initWithCoordinate:points[i]   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:nil] ];
        MKMapItem *endMapItem = [[MKMapItem alloc]initWithPlacemark:end];
        [endMapItem setName:@""];
            //[self.mapView addAnnotation:start];
            
            [self findDirectionsFrom:startMapItem to:endMapItem];
        }
        
        
        
        
        
        i++;
    }
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(21.227841, -86.735816);
    MKPointAnnotation *isla = [[MKPointAnnotation   alloc] init ];
    isla.coordinate=coordinate;
    isla.title=@"Isla Mujeres";
    [self.mapView addAnnotation:isla];
    //Create custom polyline to draw overlay
    //MKGeodesicPolyline *publicTransportPolyline = [MKGeodesicPolyline polylineWithCoordinates:points count:[_coordinates count]];
    //Add the polyline as overlay
   // [self.mapView addOverlay: publicTransportPolyline level:MKOverlayLevelAboveRoads];
    
    
    
    
    
    
    
  // MKMapItem *_srcItem = [MKMapItem mapItemForCurrentLocation];
  //  [self displayRegionCenteredOnMapItem: _srcItem];
 
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
