//
//  MemberEditController.h
//  IME
//
//  Created by apple on 2019/1/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberEditView.h"
#import "ReportView.h"

#import "IMEBaseViewController.h"
@interface MemberEditController : IMEBaseViewController <MemberEditViewDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,ReportViewDelegate>{
    MemberEditView * _memberEditView;
    ReportView * _reportView;
    NSString * _imgNo;
}
//----AvatarPhoto
@property (strong, nonatomic) UIPopoverController *imagePickerPopover;


@end
