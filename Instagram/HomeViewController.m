//
//  HomeViewController.m
//  Instagram
//
//  Created by jessicasyl on 7/6/21.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>

@implementation HomeViewController

- (IBAction)didLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error){
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
}

@end
