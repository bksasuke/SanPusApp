//
//  FriendListViewController.m
//  hidezo
//
//  Created by Tung Dao on 9/17/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import "FriendListViewController.h"
#import "AppDelegate.h"
#import "FriendTableViewCell.h"
#import "FriendObject.h"
#import "PopupShowInfomation.h"
#import "ChatViewController.h"
#import "OrderListViewController.h"
@interface FriendListViewController ()<UITableViewDataSource,UITableViewDelegate,FriendTableViewCellDeleGate>{
    NSMutableArray*friendArray;
}
@property (weak, nonatomic) IBOutlet UITableView *friendTableView;

@end

@implementation FriendListViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addLeftMenuButton2];
}
-(void) initView{
    friendArray=[[NSMutableArray alloc] init];
    self.friendTableView.dataSource=self;
    self.friendTableView.delegate=self;
    [self getDataFromServer];
}

 #pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[FriendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.delegate=self;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    FriendObject *obj=[friendArray objectAtIndex:indexPath.row];
//    cell.nameLabel.text=obj.friendName;
    cell.textLabel.text= @"2016/1/15";
    return cell;
}
 #pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendObject*objSelect=[friendArray objectAtIndex:indexPath.row];
    PopupShowInfomation *popup=[[PopupShowInfomation alloc] init];
    popup.strName=objSelect.friendName;
    popup.strAddress=objSelect.friendEmail;
    popup.strTel=objSelect.friendTel;
    popup.strEmail=objSelect.friendEmail;
    popup.vcParent=self;
    [self presentPopupViewController:popup animated:YES completion:nil];
}
#pragma mark - FriendTableViewCellDelegate
-(void)actionTransformToChat:(FriendTableViewCell *)cell{
    UIStoryboard*mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ChatViewController*chatViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"ChatViewController"];
    [self.navigationController pushViewController:chatViewController animated:YES];
}
-(void)actionTransformToShop:(FriendTableViewCell *)cell{
    NSIndexPath *indexPath = [self.friendTableView indexPathForCell:cell];
    FriendObject*obj=[friendArray objectAtIndex:indexPath.row];
    UIStoryboard*mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    OrderListViewController*orderListViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"OrderListViewController"];
    orderListViewController.strSupplierID=obj.friendID;
    [self.navigationController pushViewController:orderListViewController animated:YES];
    
}
#pragma mark - Get Data
-(void) getDataFromServer{
   HidezoAccount *account = [_appController getAccountFromUserDefault];
    [_appController parseGetFriendsWithUuid:_appController.uuidString andId:account.userId completion:^(BOOL success, NSArray *arrFriends) {
        if(success){
            for (NSDictionary*dicObject in arrFriends) {
                FriendObject*obj=[[FriendObject alloc] initWithDictionary:dicObject];
                [friendArray addObject:obj];
            }
            [self.friendTableView reloadData];
        }
    }];
}
@end
