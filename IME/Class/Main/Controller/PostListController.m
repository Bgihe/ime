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
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"PostListView show");
}
/*
-(void)viewDidDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:NO];

}*/
-(void)pushPostController{
    NSLog(@"Success");
    
    PostController * postController = [[PostController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController pushViewController: postController animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}
@end
