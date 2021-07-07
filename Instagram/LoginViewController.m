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
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameTextField.text;
    //newUser.email = self.emailField.text;
    newUser.password = self.passwordTextField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"firstSegue" sender:nil];
            
            // manually segue to logged in view
        }
    }];
    
}

- (void)loginUser {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            [self performSegueWithIdentifier:@"firstSegue" sender:nil];
            
            // display view controller that needs to shown after successful login
        }
    }];
    
}

@end
