//
//  DepositView.m
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositView.h"
#import "DepositCell.h"
@implementation DepositView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];

        dispatch_async(dispatch_get_main_queue(), ^{
            CATransition *transition = [CATransition animation];
            transition.duration = 0;
            transition.type = kCATransitionFromLeft;//kCATransitionFromBottom
            transition.subtype = kCATransitionFromLeft;
            [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
            
            [self->_customerServiceView.layer addAnimation:transition forKey:nil];
            self->_customerServiceView.clipsToBounds = YES;
            self->_customerServiceView.layer.masksToBounds = YES;
            //漸層光澤
            CAGradientLayer *gradient = [CAGradientLayer layer];
            
            gradient.frame = self->_customerServiceView.bounds;
            gradient.startPoint = CGPointMake(0.0, 0.5);
            gradient.endPoint = CGPointMake(1.0, 0.5);
            
            gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0/255.0 green:181.0/255.0 blue:102.0/255.0 alpha:1] CGColor], (id)[[UIColor colorWithRed:223.0/255.0 green:81.0/255.0 blue:83.0/255.0 alpha:1] CGColor], nil]; // 由上到下的漸層顏色
            
            [self->_customerServiceView.layer insertSublayer:gradient atIndex:0];
            [self->_customerServiceView.layer addAnimation:transition forKey:nil];
        });
        
        
  
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"DepositView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
- (void)resetBtnColor{
    [_ATMBtn setTitleColor:[UIColor colorWithRed:53.0f/255.0f green:125.0f/255.0f blue:138.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [_CVSBtn setTitleColor:[UIColor colorWithRed:53.0f/255.0f green:125.0f/255.0f blue:138.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [_cardBtn setTitleColor:[UIColor colorWithRed:53.0f/255.0f green:125.0f/255.0f blue:138.0f/255.0f alpha:1] forState:UIControlStateNormal];
    
}
- (void)updateBtnColor :(long) tag{
    [self resetBtnColor];
    switch (tag) {
        case 400:
            [_ATMBtn setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:67.0f/255.0f blue:69.0f/255.0f alpha:1] forState:UIControlStateNormal];
            break;
        case 401:
            [_CVSBtn setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:67.0f/255.0f blue:69.0f/255.0f alpha:1] forState:UIControlStateNormal];
            break;
        case 402:
            [_cardBtn setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:67.0f/255.0f blue:69.0f/255.0f alpha:1] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
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
    return [[_dataArr objectAtIndex:0] count];
}


// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableView.frame.size.height/10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    DepositCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"DepositCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[DepositCell class]]) {
                cell = (DepositCell *)view;
            }
        }
    }
    cell.daimondLabel.text = [[_dataArr objectAtIndex:0] objectAtIndex:indexPath.row];
    cell.bonusALabel.text =[[_dataArr objectAtIndex:1] objectAtIndex:indexPath.row];
    cell.bonusBLabel.text =[[_dataArr objectAtIndex:2] objectAtIndex:indexPath.row];
    cell.amountLabel.text =[[_dataArr objectAtIndex:3] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [_delegate clickTableViewCell:(int)indexPath.row];
}
@end
