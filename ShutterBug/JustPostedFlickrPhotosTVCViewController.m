//
//  JustPostedFlickrPhotosTVCViewController.m
//  ShutterBug
//
//  Created by Andrew Codispoti on 2014-12-30.
//  Copyright (c) 2014 Andrew Codispoti. All rights reserved.
//

#import "JustPostedFlickrPhotosTVCViewController.h"
#import "FlickrFetcher.h"
@interface JustPostedFlickrPhotosTVCViewController ()

@end

@implementation JustPostedFlickrPhotosTVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
    // Do any additional setup after loading the view.
}
-(void)fetchPhotos{
    NSURL *url=[FlickrFetcher URLforRecentGeoreferencedPhotos];
    NSData *jsonResults=[NSData dataWithContentsOfURL:url];
#warning Will block the main thread, need to make asynchronous
    NSDictionary *propertylistresults=[NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    NSLog(@"%@",propertylistresults);
    NSArray *photos=[propertylistresults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.photos=photos;
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
