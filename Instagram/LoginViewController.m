//
//  LoginViewController.m
//  Instagram
//
//  Created by jessicasyl on 7/6/21.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "HomeViewController.h"


@implementation LoginViewController
- (void)viewDidLoad{
    [super viewDidLoad];
}
- (IBAction)didLogin:(id)sender {
    [self loginUser];
}
- (IBAction)didSignUp:(id)sender {
    [self registerUser];
    
}

- (void)registerUser {

    [self performSegueWithIdentifier:@"secondSegue" sender:nil];
            
         
      
}

- (void)loginUser {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            self.usernameTextField.text = @"";
            self.passwordTextField.text = @"";
            
            [self performSegueWithIdentifier:@"firstSegue" sender:nil];
            
            // display view controller that needs to shown after successful login
        }
    }];
    
}

@end
