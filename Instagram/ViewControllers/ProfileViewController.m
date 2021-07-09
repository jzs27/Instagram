//
//  ProfileViewController.m
//  Instagram
//
//  Created by jessicasyl on 7/9/21.
//
#import "PostCollectionCell.h"
#import "ProfileViewController.h"
#import "PostObject.h"
#import <Parse/Parse.h>
#import "DetailsViewController.h"
@interface ProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property NSMutableArray *arrayOfPosts;
@property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UICollectionView *profileCollectionView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onTimer];
    PFUser *user = [PFUser currentUser];
    self.usernameLabel.text = user.username;
    
    self.profileCollectionView.dataSource = self;
    self.profileCollectionView.delegate = self;
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(onTimer) forControlEvents:UIControlEventValueChanged];
    
    [self.profileCollectionView insertSubview:self.refreshControl atIndex:0];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.profileCollectionView.collectionViewLayout;
        //autolayout for collection view
        layout.minimumInteritemSpacing = 2.5;
        layout.minimumLineSpacing = 2.5;
        
        CGFloat postsPerRow = 3;
        CGFloat itemWidth = (self.view.frame.size.width - layout.minimumInteritemSpacing * (postsPerRow - 1)) / postsPerRow;
        CGFloat itemHeight = itemWidth;
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    // Do any additional setup after loading the view.
}

- (void)onTimer {
   //calls query from database
    [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"author" equalTo:user];
    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.arrayOfPosts=posts;
            
            [self.profileCollectionView reloadData];
            // do something with the array of object returned by the call
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"Tapping on cell!");
    PostObject *post = sender;
    
    UINavigationController *navController  = [segue destinationViewController];
    DetailsViewController *detailsViewController = [navController topViewController];
    detailsViewController.post= post;
    NSLog(@"%@",post);
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Tapping on cell!");
    PostObject *post = self.arrayOfPosts[indexPath.row];
    [self performSegueWithIdentifier:@"fromProfileView" sender:post];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionCell" forIndexPath:indexPath];
    PostObject *post = self.arrayOfPosts[indexPath.item];
    
    cell.post = post;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}



@end
