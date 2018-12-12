//
//  PostListController.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "PostListController.h"
#import "PostController.h"
@interface PostListController ()

@end

@implementation PostListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _postListView = [[PostListView alloc] init];
    _postListView.delegate = self;
    _postListView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_postListView.view];
    
    [_postListView.backBtn addTarget:self action:@selector(clicBackBtn:) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)clicBackBtn:(id)sender {
    [self removeChild:self];
}
-(void)addPostView{
    NSLog(@"Success");
    
    PostController * postController = [[PostController alloc] init];
    [self presentViewController:postController animated:YES completion:NULL];
}
@end
