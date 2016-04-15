//
//  MapViewController.m
//  House
//
//  Created by dlut on 16/4/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "MapViewController.h"
#import "JCPrefixHeader.pch"

@interface MapViewController ()
@property(nonatomic, strong) QMapView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView = [[QMapView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.mapView setZoomLevel:15 animated:YES];
    [self.view addSubview:self.mapView];
    QPointAnnotation *annotation = [[QPointAnnotation alloc] init];
    double lat = 38.90;
    double lng = 121.60;
    [annotation setCoordinate:CLLocationCoordinate2DMake(lat, lng)];
    [annotation setTitle:@"我的位置"];
    [self.mapView addAnnotation:annotation];
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(lat, lng) animated:YES];
    [self.mapView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma QMapViewDelegate
- (void)mapView:(QMapView *)mapView didDeselectAnnotationView:(QAnnotationView *)view {
    QPointAnnotation *annotation = view.annotation;
    NSLog(@"You clicked QMapView, title is %@", annotation.title);
}

- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation {
    QPinAnnotationView *annotationView = [[QPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ANNOTATION"];
    [annotationView setTintColor:[UIColor greenColor]];
    return annotationView;
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
