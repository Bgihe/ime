//
//  DepositCell.m
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositCell.h"

@implementation DepositCell

- (void)awakeFromNib {
    [super awakeFromNib];
    /*
    CAShapeLayer *triangleLayer = [[CAShapeLayer alloc]init];
    UIBezierPath *path = [UIBezierPath bezierPath];

    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%f:%f",CGRectGetMaxY(self->_testStack.frame),CGRectGetMinY(self->_testStack.frame));
        [path moveToPoint:CGPointMake(self->_testStack.frame.origin.x+50, CGRectGetMaxY(self->_testStack.frame))];
        [path addLineToPoint:CGPointMake(self->_testStack.frame.origin.x+100, CGRectGetMinY(self->_testStack.frame))];
        [path addLineToPoint:CGPointMake(self->_testStack.frame.origin.x+150, CGRectGetMaxY(self->_testStack.frame))];
        
        triangleLayer.path = path.CGPath;
        [self.layer addSublayer:triangleLayer];
        [triangleLayer setFillColor:[UIColor cyanColor].CGColor];
    });
    */
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_amountLabel.contentMode=UIViewContentModeScaleAspectFill;
        self->_amountLabel.layer.cornerRadius = 3;
        self->_amountLabel.clipsToBounds = YES;
        self->_amountLabel.layer.borderWidth = 1;
        self->_amountLabel.layer.borderColor = [UIColor colorWithRed:53.0/255.0 green:125.0/255.0 blue:138.0/255.0 alpha:1].CGColor;
        self->_amountLabel.contentMode=UIViewContentModeScaleAspectFill;
        self->_amountLabel.layer.masksToBounds = YES;
    });
    //amountLabel

}
/*
- (void)drawRect:(CGRect)rect
{
    //NSLog(@"%f",_leftTriangle.frame.origin.x);
    //NSLog(@"%f",_testStack.frame.origin.x);
    NSLog(@"%f",CGRectGetMaxY(_testStack.frame));
    //设置背景颜色
    //[[UIColor clearColor]set];
    //UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    //CGRectGetMaxX
    
    CGContextMoveToPoint(context, _testStack.frame.origin.x , CGRectGetMaxY(_testStack.frame));//设置起点
    CGContextAddLineToPoint(context, _testStack.frame.origin.x +20, (CGRectGetMaxY(_testStack.frame) + CGRectGetMinY(_testStack.frame))/2);
    CGContextAddLineToPoint(context, _testStack.frame.origin.x , CGRectGetMinY(_testStack.frame));
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [[UIColor redColor] setFill]; //设置填充色
    [[UIColor redColor] setStroke]; //设置边框颜色
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
}*/
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
