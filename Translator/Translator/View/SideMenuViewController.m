//
//  SideMenuViewController.m
//  Translator
//
//  Created by a on 22/10/18.
//  Copyright © 2018 TMS. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController
{
    NSArray *list;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    list = [[NSArray alloc] initWithObjects:@"Home", @"Phrasebook", @"Offline Translation", @"Settings", @"Help & Feedback", nil];
    [self UI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)UI
{
    UIScrollView *bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [bgview setContentSize:CGSizeMake(0, 500)];
    
    UIImageView *img = [self UIImage:self withFrame:CGRectMake(20, 60, 100, 100) withImageName:@"logo_small"];
    [[img layer] setCornerRadius:img.frame.size.width/2];
    [bgview addSubview:img];
    
    UILabel *username = [self UILabel:self withFrame:CGRectMake(20, img.frame.origin.y+img.frame.size.height+10, WIDTH-40, 20) withText:@"username" withTextSize:16 withAlignment:0 withLines:0];
    [bgview addSubview:username];
    
    UILabel *email = [self UILabel:self withFrame:CGRectMake(20, username.frame.origin.y+username.frame.size.height, WIDTH-40, 20) withText:@"email@afdad.com" withTextSize:16 withAlignment:0 withLines:0];
    [bgview addSubview: email];
    
    UITableView *table = [self UITableView:self withFrame:CGRectMake(0, email.frame.origin.y+email.frame.size.height+10, WIDTH, HEIGHT-(email.frame.origin.y+email.frame.size.height+10)) withStyle:0];
    [bgview addSubview:table];
    
    [[self view] addSubview:bgview];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [list objectAtIndex:[indexPath row]];
    
    return cell;
}

#pragma mark - Tableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0) {
        [[[self splitViewController] navigationController] popViewControllerAnimated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
