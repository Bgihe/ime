//
//  FansView.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansView.h"
#import "FansCell.h"

@implementation FansView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
//        _dataArr = [[NSMutableArray alloc] init];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"FansView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
    
}
#pragma mark - TableView Config
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//----改tableview header
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return 0;
}
//-----Header 高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArr count];
}


// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height/10.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    FansCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"FansCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[FansCell class]]) {
                cell = (FansCell *)view;
            }
        }
    }
    if (_btnTag == 300) {
        cell.followBtn.hidden = YES;
    }else{
        cell.followBtn.hidden = NO;
    }
 
    
    if (![[[_dataArr objectAtIndex:indexPath.row]objectForKey:@"account"]  isKindOfClass:[NSNull class]]) {
        if ([[[_dataArr objectAtIndex:indexPath.row]objectForKey:@"account"] isKindOfClass:[NSNumber class]]) {
            cell.idLabel.text = [[[_dataArr objectAtIndex:indexPath.row]objectForKey:@"account"] stringValue];
        }else{
            cell.idLabel.text = [[_dataArr objectAtIndex:indexPath.row]objectForKey:@"account"];
        }
    }
    
    if (![[[_dataArr objectAtIndex:indexPath.row]objectForKey:@"introduction"]  isKindOfClass:[NSNull class]]) {
        cell.msgLabel.text = [[_dataArr objectAtIndex:indexPath.row]objectForKey:@"introduction"];
    }
    
 
    if ([[[_dataArr objectAtIndex:indexPath.row] objectForKey:@"gender"] isEqualToString:@"F"]) {
        [cell.headImg setImage:[UIImage imageNamed:@"default_avatar2"] forState:UIControlStateNormal];
        //default_avatar2
    }else{
        [cell.headImg setImage:[UIImage imageNamed:@"default_avatar_m2"] forState:UIControlStateNormal];
        //default_avatar_m2
    }
    
    if (![[[_dataArr objectAtIndex:indexPath.row] objectForKey:@"thumbnail"] isKindOfClass:[NSNull class]]) {
        NSArray * partitionArr =[[[_dataArr objectAtIndex:indexPath.row] objectForKey:@"thumbnail"] componentsSeparatedByString:@","];
        NSData *decodedImageData = [[NSData alloc]
                                    initWithBase64EncodedString:[partitionArr objectAtIndex:1] options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
        //cell.headImg.image = [UIImage imageWithData:decodedImageData];
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation: UIStatusBarAnimationSlide];
        UIImage *image=[UIImage imageWithData:decodedImageData];
        CGFloat fixelW = CGImageGetWidth(image.CGImage);
        CGRect rect = CGRectMake(0, 0, fixelW, fixelW);//创建矩形框
        
        [cell.headImg setImage:[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)] forState:UIControlStateNormal];
 
    }
    
  
    [cell.followBtn addTarget:self action:@selector(followBtClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [_delegate pushSpotLightView];
    [_delegate addSpotLightView:<#(nonnull NSMutableArray *)#>]
    
}

- (void)followBtClicked:(UIButton*)sender{
    NSLog(@"work!");
    //[sender setImage:[UIImage imageNamed:@"followed.png"] forState:UIControlStateNormal];
    //sender.backgroundColor = [UIColor grayColor];
    [sender setTitle:@"+追蹤" forState:UIControlStateNormal];
}
@end
