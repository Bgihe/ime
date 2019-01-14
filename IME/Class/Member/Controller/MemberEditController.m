//
//  MemberEditController.m
//  IME
//
//  Created by apple on 2019/1/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MemberEditController.h"
#import "MemberController.h"
#import "NetHttpsModel.h"
#import "MemberModel.h"
#import "PermissionsModel.h"
#import <SVProgressHUD.h>


@interface MemberEditController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverControllerDelegate,NetHttpsModelDelegate>

@end

@implementation MemberEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    _memberEditView = [[MemberEditView alloc] init];
    _memberEditView.delegate = self;
    _memberEditView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberEditView.view];
    
    [_memberEditView.previewBtn addTarget:self action:@selector(clickPreviewBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithTitle:@"儲存" style:UIBarButtonItemStylePlain target:self action:@selector(clickSaveBtn:)];
    self.navigationItem.rightBarButtonItem = saveItem;

}




-(void) addPicture {
  
    if ([self.imagePickerPopover isPopoverVisible]) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.editing = YES;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
 
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"請選擇打開方式" message:nil preferredStyle:  UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"相機" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
 
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
 
        }else{
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"相簿" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
 
        }else{
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //取消；
    }]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
}
-(void) addReportView : (NSString*) no{
    NSLog(@"%@",_imgNo);
    _imgNo = no;
    if (!_reportView) {
        _reportView = [[ReportView alloc] init];
        _reportView.delegate = self;
        _reportView.view.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        //[self.view addSubview:_reportView.view];
        
        [self.navigationController.view addSubview:_reportView.view];
        
        
        [_reportView.firstBtn setTitle:@"設為大頭照" forState:UIControlStateNormal];
        [_reportView.secondBtn setTitle:@"刪除" forState:UIControlStateNormal];
   
        [_reportView.firstBtn addTarget:self action:@selector(clickFirstBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_reportView.secondBtn addTarget:self action:@selector(clickSecondBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_reportView.cancelBtn addTarget:self action:@selector(clickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)clickFirstBtn:(UIButton*)sender {
    [SVProgressHUD showWithStatus:@"loadding"];
 
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];

    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"no"] = [[NSString alloc] initWithFormat:@"%@",_imgNo];
    
    //[self postSetDefaultPicture:paramDict];
    
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_set_default_picture paramDict:paramDict];
    
    
    [_reportView.view removeFromSuperview];
    _reportView = nil;
}
-(void)clickSecondBtn:(id)sender {
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"no"] = [[NSString alloc] initWithFormat:@"%@",_imgNo];
    
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_del_picture paramDict:paramDict];
    
    [_reportView.view removeFromSuperview];
    _reportView = nil;
    
}
-(void)clickSaveBtn:(id)sender {
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"introduction"] = _memberEditView.introTextView.text;
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_member_update paramDict:paramDict];
}
-(void)clickCancelBtn:(id)sender {
    [_reportView.view removeFromSuperview];
    _reportView = nil;
}

- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url {
    
    if ([url isEqualToString:URL_get_my_data]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            //---- Member
            
            MemberModel * memberModel = [[MemberModel alloc] init];
            memberModel = [MemberModel instance];
            NSDictionary *memberDict = [responseObject objectForKey:@"data"];
            //thumbnail
            for(NSString *key in [memberDict allKeys]) {
                NSString *value = [memberDict objectForKey:key];
                if([value isKindOfClass:[NSNumber class]]){
                    value = [NSString stringWithFormat:@"%@",value];
                }else if([value isKindOfClass:[NSNull class]])
                    value = @"";
                @try {
                    [memberModel setValue:value forKey:key];
                }
                @catch (NSException *exception) {
                    //DLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
                    DLog(@"欄位%@不再model裡面",key);
                }
            }
            //---- Permissions
            PermissionsModel * permissionsModel = [PermissionsModel instance];
            NSDictionary *permissionsDict = [[responseObject objectForKey:@"data"] objectForKey:@"permissions"];
            
            for(NSString *key in [permissionsDict allKeys]) {
                NSString *value = [permissionsDict objectForKey:key];
                if([value isKindOfClass:[NSNumber class]]){
                    value = [NSString stringWithFormat:@"%@",value];
                    DLog(@"Value%@",value);
                }else if([value isKindOfClass:[NSNull class]])
                    value = @"";
                @try {
                    [permissionsModel setValue:value forKey:key];
                }
                @catch (NSException *exception) {
                    DLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
                }
            }
            
            
            _memberEditView.dataArr =  memberModel.pictures;
            [_memberEditView.collectionView reloadData];
            [SVProgressHUD dismiss];
            
        }else{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"訊息"
                                          message:[responseObject objectForKey:@"error"]
                                          preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }else if([url isEqualToString:URL_set_default_picture]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            
            LoginModel * loginModel = [LoginModel instance];
            NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
            paramDict[@"token"] = loginModel.token;
            paramDict[@"setting"] = @"0";
            paramDict[@"pictures"] = @"1";
            
            NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
            netHttpsModel.delegate = self;
            [netHttpsModel POSTWithUrl:URL_get_my_data paramDict:paramDict];
        }else{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"訊息"
                                          message:[responseObject objectForKey:@"error"]
                                          preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }else if([url isEqualToString:URL_del_picture]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            
            LoginModel * loginModel = [LoginModel instance];
            NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
            paramDict[@"token"] = loginModel.token;
            paramDict[@"setting"] = @"0";
            paramDict[@"pictures"] = @"1";
            
            NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
            netHttpsModel.delegate = self;
            [netHttpsModel POSTWithUrl:URL_get_my_data paramDict:paramDict];
        }else{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"訊息"
                                          message:[responseObject objectForKey:@"error"]
                                          preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }else if([url isEqualToString:URL_upload_picture]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            
            LoginModel * loginModel = [LoginModel instance];
            NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
            paramDict[@"token"] = loginModel.token;
            paramDict[@"setting"] = @"0";
            paramDict[@"pictures"] = @"1";
            
            NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
            netHttpsModel.delegate = self;
            [netHttpsModel POSTWithUrl:URL_get_my_data paramDict:paramDict];
            
        }else{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"訊息"
                                          message:[responseObject objectForKey:@"error"]
                                          preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }else if([url isEqualToString:URL_member_update]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            NSLog(@"Success");
            NSLog(@"%@",responseObject);
            
            [SVProgressHUD showSuccessWithStatus:@"儲存成功"];
            
            self.tabBarController.tabBar.hidden = NO;
            self.navigationController.navigationBarHidden=NO;
            [self.navigationController popViewControllerAnimated:NO];
            
        }
    }
 
}



-(IBAction) clickPreviewBtn:(id)sender {
    //SpotLightView.h
 
    _spotLightView = [[SpotLightView alloc] init];
    _spotLightView.delegate = self;
    _spotLightView.view.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    [self.navigationController.view addSubview:_spotLightView.view];
    
    
    [_spotLightView.backBtn addTarget:self action:@selector(clickSpotLightBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.moreMsgBtn addTarget:self action:@selector(clickSpotLightMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    MemberModel * memberModel = [MemberModel instance];
 
    if (memberModel.thumbnail) {
        NSArray *partitionArr = [[NSArray alloc]init];
        partitionArr =[memberModel.thumbnail componentsSeparatedByString:@","];
        NSData *decodedImageData = [[NSData alloc]
                                    initWithBase64EncodedString:[partitionArr objectAtIndex:1] options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
        UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
        [_spotLightView refreshUI:decodedImage :_memberEditView.introTextView.text :memberModel.account ];
    }
 
}
-(void)clickSpotLightMoreBtn:(UIButton*)sender {
    [_spotLightView refreshMsgRect];
}
-(void)clickSpotLightBackBtn:(UIButton*)sender {
    [_spotLightView.view removeFromSuperview];
    _spotLightView = nil;
}

// 選取照片以後
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [self fixOrientation:[info valueForKey:UIImagePickerControllerEditedImage]];//UIImagePickerControllerOriginalImage
    
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    //压缩图片,如果图片要上传到服务器或者网络，则需要执行该步骤（压缩），第二个参数是压缩比例，转化为NSData类型；
    NSData *data = UIImageJPEGRepresentation(image, 0.1f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
   
    NSLog(@"data:image/jpeg;base64,%@",encodedImageStr);
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"picture"] = [[NSString alloc] initWithFormat:@"data:image/jpeg;base64,%@",encodedImageStr];
    
    [SVProgressHUD showWithStatus:@"loadding"];
    //[self postUploadPicture:paramDict];
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_upload_picture paramDict:paramDict];
    
    
    //判断UIPopoverController对象是否存在
    if (self.imagePickerPopover) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
    }else{
        //关闭以模态形式显示的UIImagePickerController
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


// 圖片轉正
- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
