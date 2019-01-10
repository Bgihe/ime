//
//  MemberEditController.m
//  IME
//
//  Created by apple on 2019/1/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MemberEditController.h"

@interface MemberEditController ()

@end

@implementation MemberEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    _memberEditView = [[MemberEditView alloc] init];
    _memberEditView.delegate = self;
    _memberEditView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberEditView.view];
    
    [_memberEditView.previewBtn addTarget:self action:@selector(testBTn:) forControlEvents:UIControlEventTouchUpInside];
    
   //previewBtn
}
-(void) addReportView : (NSString*) no{
    NSLog(@"%@",_imgNo);
    _imgNo = no;
    if (!_reportView) {
        _reportView = [[ReportView alloc] init];
        _reportView.delegate = self;
        _reportView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:_reportView.view];
        
        [_reportView.firstBtn setTitle:@"設為大頭照" forState:UIControlStateNormal];
        [_reportView.secondBtn setTitle:@"刪除" forState:UIControlStateNormal];
   
        [_reportView.firstBtn addTarget:self action:@selector(clickFirstBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_reportView.secondBtn addTarget:self action:@selector(clickSecondBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_reportView.cancelBtn addTarget:self action:@selector(clickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
        //self.navigationController.navigationBarHidden=YES;
    }
}
-(void)clickFirstBtn:(UIButton*)sender {
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];

    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"no"] = [[NSString alloc] initWithFormat:@"%@",_imgNo];
    
    [self postSetDefaultPicture:paramDict];
}
-(void)clickSecondBtn:(id)sender {
    
}
-(void)clickCancelBtn:(id)sender {
    //self.navigationController.navigationBarHidden=NO;
    [_reportView.view removeFromSuperview];
    _reportView = nil;
}
- (void) postSetDefaultPicture : (NSMutableDictionary*) paramDict{
    NetHttpsManager * netHttpsManager = [[NetHttpsManager alloc] init];
    if (![netHttpsManager isExistenceNetwork])
    {
        DLog(@"請檢查網路");
    }
    else
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:[URL_main stringByAppendingString:URL_set_default_picture] parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"Http Success!!");
            NSLog(@"%@",responseObject);
            
            if ([responseObject objectForKey:@"success"]) {
                
                
            }else{
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"訊息"
                                              message:[responseObject objectForKey:@"error"]
                                              preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"Http Fail!!");
        }];
    }
}




-(IBAction) testBTn:(id)sender {
    NSLog(@"%@",_memberEditView.introTextView.text);
    NSString * str =[[ NSString alloc] init];
    str = _memberEditView.introTextView. text;
    
    
}


-(IBAction) void_image_choose:(id)sender {
    if ([self.imagePickerPopover isPopoverVisible]) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.editing = YES;
    imagePicker.delegate = self;

    //允许编辑图片
    imagePicker.allowsEditing = NO;

    
    /*
     这里以弹出选择框的形式让用户选择是打开照相机还是图库
     */
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"請選擇打開方式" message:nil preferredStyle:  UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"相機" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //创建UIPopoverController对象前先检查当前设备是不是ipad
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
            self.imagePickerPopover.delegate = self;
            [self.imagePickerPopover presentPopoverFromBarButtonItem:sender
                                            permittedArrowDirections:UIPopoverArrowDirectionAny
                                                            animated:YES];
        }else{
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"相簿" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //创建UIPopoverController对象前先检查当前设备是不是ipad
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
            self.imagePickerPopover.delegate = self;
            [self.imagePickerPopover presentPopoverFromBarButtonItem:sender
                                            permittedArrowDirections:UIPopoverArrowDirectionAny
                                                            animated:YES];
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
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //通过info字典获取选择的照片
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    //以itemKey为键，将照片存入ImageStore对象中
    //[[MyImageStore sharedStore] setImage:image forKey:@"CYFStore"];
    //将照片放入UIImageView对象
    //self.avatarImage.image = image;
    //把一张照片保存到图库中，此时无论是这张照片是照相机拍的还是本身从图库中取出的，都会保存到图库中；
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    //压缩图片,如果图片要上传到服务器或者网络，则需要执行该步骤（压缩），第二个参数是压缩比例，转化为NSData类型；
    NSData *fileData = UIImageJPEGRepresentation(image, 1.0);
    //判断UIPopoverController对象是否存在
    if (self.imagePickerPopover) {
        
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
    }else{
        //关闭以模态形式显示的UIImagePickerController
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
