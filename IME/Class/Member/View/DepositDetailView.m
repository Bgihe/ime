//
//  DepositDetailView.m
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositDetailView.h"
#import "DepositCell.h"
#import "DepositDetailCell.h"
@implementation DepositDetailView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];

        _dataArr = [[NSArray alloc] init];
        _isConfirm = NO;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            CATransition *transition = [CATransition animation];
            transition.duration = 0;
            transition.type = kCATransitionFromLeft;//kCATransitionFromBottom
            transition.subtype = kCATransitionFromLeft;
            [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
            [self->_confirmView.layer addAnimation:transition forKey:nil];
            self->_confirmView.clipsToBounds = YES;
            self->_confirmView.layer.masksToBounds = YES;
            //漸層光澤
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame = self->_confirmView.bounds;
            gradient.startPoint = CGPointMake(0.0, 0.5);
            gradient.endPoint = CGPointMake(1.0, 0.5);
            gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0/255.0 green:181.0/255.0 blue:102.0/255.0 alpha:1] CGColor], (id)[[UIColor colorWithRed:223.0/255.0 green:81.0/255.0 blue:83.0/255.0 alpha:1] CGColor], nil]; // 由上到下的漸層顏色
            [self->_confirmView.layer insertSublayer:gradient atIndex:0];
            [self->_confirmView.layer addAnimation:transition forKey:nil];
            
            self->_confirmView.layer.cornerRadius = CGRectGetHeight(self->_confirmView.frame)/2;
            self->_confirmView.clipsToBounds = YES;
        });
 
        _daimondTopImg = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, 20, 20)];
        _daimondTopImg.image = [UIImage imageNamed:@"icon_daimond"];
        [self.view addSubview:_daimondTopImg];
        
        _daimondTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_daimondTopImg.frame) +5, 20, KScreenWidth*0.2, 20)];
        _daimondTopLabel.text = @"9,527";
        _daimondTopLabel.textColor = [UIColor colorWithRed:138.0/255.0 green:213.0/255.0 blue:215.0/255.0 alpha:1];
        [self.view addSubview:_daimondTopLabel];
        
        
        _amountTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth - 120, 20, 100, 20)];
        _amountTopLabel.text = @"$1,500";
        _amountTopLabel.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:_amountTopLabel];
        
        _titleTopImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_daimondTopLabel.frame)+20, 10, 10)];
        _titleTopImg.image = [UIImage imageNamed:@"icon_title"];
        [self.view addSubview:_titleTopImg];
        
        _titleTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleTopImg.frame)+10, CGRectGetMaxY(_daimondTopLabel.frame)+20, 100, 10)];
        _titleTopLabel.text = @"付款類型";
        _titleTopLabel.font = [UIFont systemFontOfSize:12];
        _titleTopLabel.textColor = [UIColor lightGrayColor];
        [self.view addSubview:_titleTopLabel];
        
        
        _creditNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_titleTopLabel.frame)+10, KScreenWidth - 30, 30)];
        _creditNameLabel.text = @"超商代碼繳款";
        _creditNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_creditNameLabel];
        
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_creditNameLabel.frame)+10, KScreenWidth - 30, _dataArr.count*20)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        
        _subSaveView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tableView.frame)+10, KScreenWidth, KScreenHeight - CGRectGetMaxY(_tableView.frame))];
        //_subSaveView.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:_subSaveView];
        
        //----儲值點數
        _titleBottomImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_tableView.frame)+10, 10, 10)];
        _titleBottomImg.image = [UIImage imageNamed:@"icon_title"];
        [_subSaveView addSubview:_titleBottomImg];
        
        _titleBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleBottomImg.frame)+10, CGRectGetMaxY(_tableView.frame)+10, 100, 10)];
        _titleBottomLabel.text = @"儲值點數";
        _titleBottomLabel.font = [UIFont systemFontOfSize:12];
        _titleBottomLabel.textColor = [UIColor lightGrayColor];
        [_subSaveView addSubview:_titleBottomLabel];
        

        _daimondBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth/2 - KScreenWidth*0.1, CGRectGetMaxY(_titleBottomLabel.frame)+20, KScreenWidth*0.1, 20)];
        _daimondBottomLabel.text = @"9,527";
        _daimondBottomLabel.textAlignment = NSTextAlignmentCenter;
        _daimondBottomLabel.adjustsFontSizeToFitWidth = YES;
        _daimondBottomLabel.minimumScaleFactor = 0.5;
  
        [_subSaveView addSubview:_daimondBottomLabel];
        
        _daimondBottomImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_daimondBottomLabel.frame) -  _daimondBottomLabel.frame.size.height - 10, CGRectGetMaxY(_titleBottomLabel.frame)+20, _daimondBottomLabel.frame.size.height, _daimondBottomLabel.frame.size.height)];
        _daimondBottomImg.image = [UIImage imageNamed:@"icon_daimond"];
        [_subSaveView addSubview:_daimondBottomImg];

        _confirmView = [[UIView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_daimondBottomLabel.frame)+20, KScreenWidth - 40, KScreenHeight*0.05)];
        _confirmView.backgroundColor = [UIColor orangeColor];
        [_subSaveView addSubview:_confirmView];
        
        _amountBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, _confirmView.frame.size.width * 0.4, _confirmView.frame.size.height)];
        _amountBottomLabel.text = @"$1,500";
        _amountBottomLabel.textColor = [UIColor whiteColor];
        [_confirmView addSubview:_amountBottomLabel];
        
        
        _confirmImg = [[UIImageView alloc] initWithFrame:CGRectMake(_confirmView.frame.size.width - _confirmView.frame.size.height*0.4 - 20,  _confirmView.frame.size.height*0.3, _confirmView.frame.size.height*0.4, _confirmView.frame.size.height*0.4)];
        _confirmImg.image = [UIImage imageNamed:@"icon_arrow"];
        [_confirmView addSubview:_confirmImg];

        _confirmLabel = [[UILabel alloc] initWithFrame:CGRectMake( CGRectGetMinX(_confirmImg.frame) - _confirmView.frame.size.width * 0.4 - 20, 0, _confirmView.frame.size.width * 0.4, _confirmView.frame.size.height)];
        _confirmLabel.text = @"確認付款";
        _confirmLabel.textAlignment = NSTextAlignmentRight;
        _confirmLabel.textColor = [UIColor whiteColor];
        [_confirmView addSubview:_confirmLabel];

        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _confirmView.frame.size.width, _confirmView.frame.size.height)];
        _confirmBtn.backgroundColor = [UIColor clearColor];
        [_confirmView addSubview:_confirmBtn];

        _subBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(_subSaveView.frame) +20)];
        _subBgView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_subBgView];
        [self.view sendSubviewToBack:_subBgView];
        
        
        _subInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tableView.frame)+10, KScreenWidth, KScreenHeight - CGRectGetMaxY(_tableView.frame))];
        //_subInfoView.backgroundColor = [UIColor lightTextColor];
        [self.view addSubview:_subInfoView];
        
        _queryTitleImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 10, 10)];
        _queryTitleImg.image = [UIImage imageNamed:@"icon_title"];
        [_subInfoView addSubview:_queryTitleImg];
        
        _queryTitleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleBottomImg.frame)+10, 0, 100, 10)];
        _queryTitleLabel.text = @"付款資訊";
        _queryTitleLabel.font = [UIFont systemFontOfSize:12];
        _queryTitleLabel.textColor = [UIColor lightGrayColor];
        [_subInfoView addSubview:_queryTitleLabel];
        
        
        _payInfoTitle1Label = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_queryTitleLabel.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfoTitle1Label.text = @"繳費銀行代碼";
        _payInfoTitle1Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfoTitle1Label];
        
        _payInfo1Label = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth*0.3 +20, CGRectGetMaxY(_queryTitleLabel.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfo1Label.text = @"808";
        _payInfo1Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfo1Label];
        
        _payInfoTitle2Label = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_payInfo1Label.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfoTitle2Label.text = @"繳費虛擬帳號";
        _payInfoTitle2Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfoTitle2Label];
        
        _payInfo2Label = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth*0.3 +20, CGRectGetMaxY(_payInfo1Label.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfo2Label.text = @"922345645613213536";
        _payInfo2Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfo2Label];
        
        _payInfoTitle3Label = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_payInfo2Label.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfoTitle3Label.text = @"繳費金額";
        _payInfoTitle3Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfoTitle3Label];
        
        _payInfo3Label = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth*0.3 +20, CGRectGetMaxY(_payInfo2Label.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfo3Label.text = @"$9000";
        _payInfo3Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfo3Label];
        
        _payInfoTitle4Label = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_payInfo3Label.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfoTitle4Label.text = @"繳費狀態";
        _payInfoTitle4Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfoTitle4Label];
        
        _payInfo4Label = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth*0.3 +20, CGRectGetMaxY(_payInfo3Label.frame)+15, KScreenWidth*0.3, 30 )];
        _payInfo4Label.text = @"未付款";
        _payInfo4Label.font = [UIFont systemFontOfSize:15];
        [_subInfoView addSubview:_payInfo4Label];

    }
    return self;
}

- (void)refreshInfoView : (NSMutableArray *) infoArr{
    NSString * state = [[NSString alloc] init];
    switch ([[infoArr valueForKey:@"state"] intValue]) {
        case 0:
            state = @"未付款";
            break;
        case 1:
            state = @"已付款";
            break;
        case 2:
            state = @"付款失敗";
            break;
        case 3:
            state = @"訂單取消";
            break;
        default:
            break;
    }
    
    NSString * payment = [[NSString alloc] init];
    if ([[infoArr valueForKey:@"payment"] isEqualToString:@"CVS"]) {
        payment = @"超商代碼繳款";
    }else if ([[infoArr valueForKey:@"payment"] isEqualToString:@"ATM"] ){
        payment = @"自動櫃員機";
    }else if([[infoArr valueForKey:@"payment"] isEqualToString:@"Credit"]){
        payment = @"信用卡";
    }
    
    
    NSString * amount = [[NSString alloc] initWithString:[NSNumberFormatter localizedStringFromNumber:@([[infoArr valueForKey:@"amount"] intValue])
                                                                                          numberStyle:NSNumberFormatterDecimalStyle]];
    NSString * currency = [infoArr valueForKey:@"currency"];
    _creditNameLabel.text = payment;
    _daimondTopLabel.text = [[NSString alloc] initWithString:[NSNumberFormatter localizedStringFromNumber:@([[infoArr valueForKey:@"credits"] intValue])
                                                                                              numberStyle:NSNumberFormatterDecimalStyle]];
    _amountTopLabel.text = [[NSString alloc] initWithFormat:@"$%@ %@",amount,currency];
    
    if ([[infoArr valueForKey:@"payment"] isEqualToString:@"Credit"]) {//信用卡
        _payInfoTitle1Label.text = @"繳費金額";
        _payInfoTitle2Label.text = @"繳費狀態";
        _payInfoTitle3Label.hidden = YES;
        _payInfoTitle4Label.hidden = YES;
        
        _payInfo1Label.text = [[NSString alloc] initWithFormat:@"$%@ %@",amount,currency];//amount currency
        _payInfo2Label.text = state;//state
        _payInfo3Label.hidden = YES;
        _payInfo4Label.hidden = YES;

    }else if ([[infoArr valueForKey:@"payment"] isEqualToString:@"ATM"]){//ATM
        _payInfoTitle1Label.text = @"繳費銀行代碼";
        _payInfoTitle2Label.text = @"繳費虛擬帳號";
        _payInfoTitle3Label.text = @"繳費金額";
        _payInfoTitle4Label.text = @"繳費狀態";
        
        _payInfo1Label.text = [[infoArr valueForKey:@"bank_code"] stringValue];//bank_code
        _payInfo2Label.text = [[infoArr valueForKey:@"virtual_account"] stringValue];//virtual_account
        _payInfo3Label.text = [[NSString alloc] initWithFormat:@"$%@ %@",amount,currency];//amount currency
        _payInfo4Label.text = state;//state
    }else if ([[infoArr valueForKey:@"payment"] isEqualToString:@"CVS"]){//超商
        _payInfoTitle1Label.text = @"繳費代碼";
        _payInfoTitle2Label.text = @"繳費金額";
        _payInfoTitle3Label.text = @"繳費狀態";
        _payInfoTitle4Label.hidden = YES;
        
        _payInfo1Label.text = [infoArr valueForKey:@"payment_no"];//payment_no
        _payInfo2Label.text = [[NSString alloc] initWithFormat:@"$%@ %@",amount,currency];//amount currency
        _payInfo3Label.text = state;//state
        _payInfo4Label.hidden = YES;
        
    }
}
- (void)refreshRect : (BOOL) isInfo{
    if (isInfo) {
        _subInfoView.hidden = NO;
        _subSaveView.hidden = YES;
        _tableView.frame = CGRectMake(15, CGRectGetMaxY(_creditNameLabel.frame)+10, KScreenWidth - 30, 0);
        _subInfoView.frame = CGRectMake(0, CGRectGetMaxY(_tableView.frame)+10, KScreenWidth, KScreenHeight - CGRectGetMaxY(_tableView.frame));
        _subBgView.frame = CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(_subInfoView.frame) +20);
    }else{
        _subInfoView.hidden = YES;
        _subSaveView.hidden = NO;
        _tableView.frame = CGRectMake(15, CGRectGetMaxY(_creditNameLabel.frame)+10, KScreenWidth - 30, _dataArr.count*50);
        _subSaveView.frame = CGRectMake(0, CGRectGetMaxY(_tableView.frame)+10, KScreenWidth, KScreenHeight - CGRectGetMaxY(_tableView.frame));
        _titleBottomImg.frame = CGRectMake(15, 0, 10, 10);
        _titleBottomLabel.frame = CGRectMake(CGRectGetMaxX(_titleBottomImg.frame)+10, 0, 100, 10);
        _daimondBottomLabel.frame = CGRectMake(KScreenWidth/2 - KScreenWidth*0.1, CGRectGetMaxY(_titleBottomLabel.frame)+20, KScreenWidth*0.2, 20);
        _daimondBottomImg.frame = CGRectMake(CGRectGetMinX(_daimondBottomLabel.frame) -  _daimondBottomLabel.frame.size.height - 10, CGRectGetMaxY(_titleBottomLabel.frame)+20, _daimondBottomLabel.frame.size.height, _daimondBottomLabel.frame.size.height);
        _confirmView.frame = CGRectMake(20, CGRectGetMaxY(_daimondBottomLabel.frame)+20, KScreenWidth - 40, KScreenHeight*0.05);
        _amountBottomLabel.frame = CGRectMake(20, 0, _confirmView.frame.size.width * 0.4, _confirmView.frame.size.height);
        _confirmImg.frame = CGRectMake(_confirmView.frame.size.width - _confirmView.frame.size.height*0.4 - 20,  _confirmView.frame.size.height*0.3, _confirmView.frame.size.height*0.4, _confirmView.frame.size.height*0.4);
        _confirmLabel.frame = CGRectMake( CGRectGetMinX(_confirmImg.frame) - _confirmView.frame.size.width * 0.4 - 20, 0, _confirmView.frame.size.width * 0.4, _confirmView.frame.size.height);
        _confirmBtn.frame = CGRectMake(0, 0, _confirmView.frame.size.width, _confirmView.frame.size.height);
        _subBgView.frame = CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(_subSaveView.frame) +20);
    }
}

    

- (void)refreshCreditData : (NSMutableArray *)creditData :(NSString*) creditName{
    _daimondTopLabel.text = [NSNumberFormatter localizedStringFromNumber:@([[creditData valueForKey:@"credits"] intValue])
                                                             numberStyle:NSNumberFormatterDecimalStyle];
    _daimondBottomLabel.text = [NSNumberFormatter localizedStringFromNumber:@([[creditData valueForKey:@"credits"] intValue])
                                                                numberStyle:NSNumberFormatterDecimalStyle];
    
    _amountTopLabel.text = [[NSString alloc] initWithFormat:@"$%@",[NSNumberFormatter localizedStringFromNumber:@([[creditData valueForKey:@"amount"] intValue])
                                                                                                    numberStyle:NSNumberFormatterDecimalStyle]];
    _amountBottomLabel.text = [[NSString alloc] initWithFormat:@"$%@",[NSNumberFormatter localizedStringFromNumber:@([[creditData valueForKey:@"amount"] intValue])
                                                                                                       numberStyle:NSNumberFormatterDecimalStyle]];
    
    _creditNameLabel.text = creditName;
    
}

- (void)reloadAmountLabel{
    _daimondTopLabel.text = _diamond;
    _amountTopLabel.text = _amount;
    _daimondBottomLabel.text = _diamond;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"DepositDetailView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
- (void)showPaymentInfo{
    _payStatusLabel.text = @"付款資訊";
    _saveAmountView.hidden = YES;
    _confirmView.hidden = YES;

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
    if(_isConfirm){
        return [[_dataArr objectAtIndex:0]count];
    }else{
        return [_dataArr count];
    }
}


// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    DepositDetailCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"DepositDetailCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[DepositDetailCell class]]) {
                cell = (DepositDetailCell *)view;
            }
        }
    }

    [[UITableViewCell appearance] setTintColor:[UIColor colorWithRed:138.0/255.0 green:213.0/255.0 blue:215.0/255.0 alpha:1]];
    
    if(_isConfirm){
        cell.leftLabel.text = [[_dataArr objectAtIndex:0] objectAtIndex:indexPath.row];
        cell.centerLabel.text = [[_dataArr objectAtIndex:1] objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{

        //cell.leftLabel.text = [_dataArr objectAtIndex:indexPath.row];
        cell.leftLabel.text = [[_dataArr objectAtIndex:indexPath.row] objectForKey:@"label"];
        cell.centerLabel.hidden = YES;
    }
    
 
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isConfirm) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    
    NSLog(@"%ld",(long)indexPath.row);
}


@end
