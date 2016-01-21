//
//  OrderListViewController.m
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import "OrderListViewController.h"
#import "OrderListTableViewCell.h"
#import "ProductOBJ.h"
@interface OrderListViewController ()<UITableViewDataSource,UITableViewDelegate,OrderListTableViewCellDelegate>{
    NSMutableArray*productArray;
    NSString*stringDynamicFreshness;
}
@property (weak, nonatomic) IBOutlet UITableView *productTableview;

@end

@implementation OrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackButton];
    [self initView];
    // Do any additional setup after loading the view.
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
-(void) initView{
    productArray=[[NSMutableArray alloc] init];
    self.productTableview.dataSource=self;
    self.productTableview.delegate=self;
    [self getDataFromServer:self.strSupplierID];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return productArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListTableViewCell*cell;
    cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[OrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.delegate=self;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    ProductOBJ*obj=[productArray objectAtIndex:indexPath.row];
    cell.lblName.text=obj.productName;
    cell.lblPrice.text=obj.productPrice;
    cell.lblQuantity.text=obj.scaleChoose;
    if ([stringDynamicFreshness isEqualToString:@"NG"]) {
        if ([obj.productType isEqualToString:@"dynamic"]) {
            cell.userInteractionEnabled=NO;
            cell.lblFreshness.hidden=NO;
        }else{
            cell.userInteractionEnabled=YES;
            cell.lblFreshness.hidden=YES;
        }
    }else{
        cell.userInteractionEnabled=YES;
        cell.lblFreshness.hidden=YES;
    }
    if (obj.scaleArray.count==0) {
        cell.btnChoose.hidden=YES;
        
    }
    NSMutableArray*arrScale=obj.scaleArray;
   // NSString*strFirst=[arrScale objectAtIndex:0];
    
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
}
#pragma mark - FriendTableViewCellDelegate


#pragma mark - Get Data
-(void) getDataFromServer:(NSString*) supplierID{
    HidezoAccount *account = [_appController getAccountFromUserDefault];
    [_appController parseGetProductWithSupplierID:self.strSupplierID andUuid:_appController.uuidString andId:account.userId completion:^(BOOL success, NSDictionary *response) {
        if (success) {
            stringDynamicFreshness=[response objectForKey:@"dynamic_item_freshness"];
            NSArray*dynamicArray=(NSArray*)[response objectForKey:@"dynamic_item"];
            if (dynamicArray) {
                for (NSDictionary* dicItem in dynamicArray) {
                    ProductOBJ*obj=[[ProductOBJ alloc] initWithDictionary:dicItem];
                    [productArray addObject:obj];
                }
            }
            NSArray*staticArray=(NSArray*)[response objectForKey:@"static_item"];
            if (staticArray) {
                for (NSDictionary* dicItem in staticArray) {
                    ProductOBJ*obj=[[ProductOBJ alloc] initWithDictionary:dicItem];
                    [productArray addObject:obj];
                }
            }
            [self.productTableview reloadData];
            
        }
    }];
}
@end
