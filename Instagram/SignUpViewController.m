//
//  SignUpViewController.m
//  Instagram
//
//  Created by jessicasyl on 7/7/21.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>
@interface SignUpViewController ()
@property UIAlertController *alert;
@property UIAlertAction *okAction;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"There is something wrong. Try again." preferredStyle:(UIAlertControllerStyleAlert)];
    
    self.okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle response here.
                                                     }];
    [self.alert addAction:self.okAction];

}
- (IBAction)didSignUp:(id)sender {
    PFUser *newUser = [PFUser user];

    // set user properties
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;

    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            
            [self presentViewController:self.alert animated:YES completion:^{
                // optional code for what happens after the alert controller has finished presenting
            }];
            self.usernameField.text = @"";
            self.passwordField.text = @"";
        
        } else {
            NSLog(@"User registered successfully");
            [self clearFields];
            [self performSegueWithIdentifier:@"thirdSegue" sender:nil];
            
            // manually segue to logged in view
        }
    }];
}

-(void)clearFields{
    self.usernameField.text = @"";
    self.passwordField.text=@"";
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
