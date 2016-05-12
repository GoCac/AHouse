//
//  FeedbackViewController.m
//  House
//
//  Created by dlut on 15/11/27.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "FeedbackViewController.h"
#import "StringUtils.h"
#import "UIImage+ImageWithColor.h"
#import "UIButton+Selector.h"
@interface FeedbackViewController () <UITextViewDelegate>
@property(nonatomic, strong) UITextView *textView;
@property(nonatomic, strong) UIButton *submit;
@property(nonatomic, strong) UILabel *hintlabel;
@property(nonatomic, strong) NSDictionary *attributes;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"意见反馈";
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 64 + 5, SCREEN_WIDTH - 10, (SCREEN_WIDTH - 10) * 0.42)];
    [self.textView setBackgroundColor:[UIColor lightTextColor]];
    [self.textView.layer setMasksToBounds:YES];
    [self.textView.layer setCornerRadius:6.0f];
    [self.textView.layer setBorderWidth:1.0f];
    [self.textView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.textView setReturnKeyType:UIReturnKeyDone];
    [self.textView setDelegate:self];
    [self.view addSubview:self.textView];
    
    self.submit = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.textView.frame) + 10, SCREEN_WIDTH - 20, 40)];
    [self.submit setTitle:@"提交" forState:UIControlStateNormal];
    [self.submit setBackgroundColor:[UIColor redColor]];
    [self.submit.layer setCornerRadius:5.0f];
    [self.view addSubview:self.submit];
    [self.submit addTarget:self action:@selector(submitMsg) forControlEvents:UIControlEventTouchUpInside];
    [self.submit setSelector];//设置selector
    self.hintlabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 4.5, 200, 25)];
    [self.hintlabel setText:@"输入您的留言..."];
    [self.hintlabel setEnabled:NO];
    [self.hintlabel setUserInteractionEnabled:NO];
    [self.textView addSubview:self.hintlabel];
    [self.textView setDelegate:self];
    [self.textView setScrollEnabled:NO];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:5.0];
    self.attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],
                        NSParagraphStyleAttributeName : style
                        };
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gesture];
    [self.textView becomeFirstResponder];
}

- (void)hideKeyboard {
    [self.textView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView {
    if ([self.textView.text length] == 0) {
        [self.hintlabel setHidden:NO];
        [self.textView setScrollEnabled:NO];
    } else {
        [self.hintlabel setHidden:YES];
        [self.textView setScrollEnabled:YES];
        [self.textView setAttributedText:[[NSAttributedString alloc] initWithString:self.textView.text attributes:self.attributes]];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)submitMsg {
    NSString *msg = [self.textView text];
    if ([StringUtils isEmpty:msg]) {
        return;
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:1];
    [dic setObject:msg forKey:@"content"];
    [self.manager POST:FEADBACK_URL parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (nil != responseObject && CODE_SUCCESS == [responseObject[CODE] integerValue]) {
            [self handleSuccess:@"发送成功，谢谢"];
            [self.textView setText:@""];
        } else {
            [self handleFailure:@"发送失败，请重新尝试"];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self handleFailure:@"网络连接错误，请重新尝试"];
    }];
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

@end
