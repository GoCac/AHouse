//
//  CalculatorViewController.m
//  House
//
//  Created by DUT_WuJie on 16/5/10.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "CalculatorViewController.h"
#import "NSString+Height.h"
#import "BaseViewController.h"
#define APP_BASIC_FONT_NAME @"Avenir-Book"

#define APP_BASIC_FONT_SIZE 14.0f

@interface CalculatorViewController () <UITextFieldDelegate>
@property(nonatomic, strong) UILabel *huankuanfangshiLabel;//还款方式
@property(nonatomic, strong) UILabel *priceLabel;//单价
@property(nonatomic, strong) UILabel *areaLabel;//面积
@property(nonatomic, strong) UILabel *shouFuChengShuLabel;//首付成数
@property(nonatomic, strong) UILabel *daikuanqixianLabel;//贷款期限
@property(nonatomic, strong) UILabel *nianlilvLabel;//年利率
@property(nonatomic, strong) UILabel *lilvzhekouLabel;//利率折扣

@property(nonatomic, strong) UIButton *calculateButton;//计算按钮

@property(nonatomic, strong) UITextField *huankuanfangshiUITextField;//还款方式
@property(nonatomic, strong) UITextField *shoufuchengshuUITextField;//首付成数
@property(nonatomic, strong) UITextField *daikuanqixianUITextField;//贷款期限
@property(nonatomic, strong) UITextField *lilvzhekouUITextField;//利率折扣

@property(nonatomic, strong) UITextField *priceUITextField;//单价输入
@property(nonatomic, strong) UITextField *areaUITextField;//面积输入
@property(nonatomic, strong) UITextField *nianlilvTUITextField;//年利率输入

@property(nonatomic) CGFloat nextViewStartY;//下一个视图开始的Y坐标
@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextViewStartY = 0;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"房贷计算器";
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initView {
    UIFont *basicFont = [UIFont fontWithName:APP_BASIC_FONT_NAME size:APP_BASIC_FONT_SIZE];
    CGFloat leftWidth = SCREEN_WIDTH * 0.4;
    CGFloat rightWidth = SCREEN_WIDTH * 0.6;
    CGFloat leftMargin = 25.0f;
    CGFloat topMargin = 20.0f;
    
    self.nextViewStartY += 64 + 20;
    CGFloat viewHeight = [NSString heightSingle:basicFont];
    self.huankuanfangshiLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    [self.huankuanfangshiLabel setText: @"还款方式"];
    [self.huankuanfangshiLabel setFont:basicFont];
    [self.huankuanfangshiLabel setTextAlignment:NSTextAlignmentLeft];
    self.huankuanfangshiUITextField = [[UITextField alloc] initWithFrame:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    [self.huankuanfangshiUITextField setText:@"等额还款"];
    [self.huankuanfangshiUITextField setFont:basicFont];
    [self.huankuanfangshiUITextField setTextAlignment:NSTextAlignmentLeft];
    [self.huankuanfangshiUITextField setDelegate:self];
//    [self.huankuanfangshiUITextField setUserInteractionEnabled:NO];
    [self.view addSubview:self.huankuanfangshiLabel];
    [self.view addSubview:self.huankuanfangshiUITextField];
    self.nextViewStartY += viewHeight;
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.priceLabel.text = @"单价（元/平方米）";
    self.nextViewStartY += viewHeight;
    [self.priceLabel setFont:basicFont];
    [self.view addSubview:self.priceLabel];
    
    self.areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.areaLabel.text = @"面积（平方米）";
    [self.areaLabel setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.areaLabel];
    
    
    self.shouFuChengShuLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.shouFuChengShuLabel.text = @"首付成数";
    [self.shouFuChengShuLabel setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.shouFuChengShuLabel];
    
    self.daikuanqixianLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.daikuanqixianLabel.text = @"贷款期限";
    [self.daikuanqixianLabel setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.daikuanqixianLabel];
    
    self.nianlilvLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.nianlilvLabel.text = @"年利率";
    [self.nianlilvLabel setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.nianlilvLabel];
    
    self.lilvzhekouLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.lilvzhekouLabel.text = @"利率折扣";
    [self.lilvzhekouLabel setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.lilvzhekouLabel];
    
    self.calculateButton = [[UIButton alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, SCREEN_WIDTH - leftMargin * 2, 48)];
    [self.calculateButton setTitle:@"计       算" forState:UIControlStateNormal];
    [self.calculateButton setBackgroundColor:[UIColor redColor]];
    [self.calculateButton.layer setCornerRadius:5.0f];
    self.nextViewStartY += 48;
    [self.view addSubview:self.calculateButton];
    [self.calculateButton addTarget:self action:@selector(calculate) forControlEvents:UIControlEventTouchUpInside];
    

}
-(void) initAlertView {
   
}

-(void)click {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择还款方式" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *dengebenjin = [UIAlertAction actionWithTitle:@"等额本金" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.huankuanfangshiUITextField.text = @"等额本金";
    }];
    UIAlertAction *dengebenxi = [UIAlertAction actionWithTitle:@"等额本息" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.huankuanfangshiUITextField.text = @"等额本息";
    }];
    [alertController addAction:dengebenjin];
    [alertController addAction:dengebenxi];
    [self presentViewController:alertController animated:true completion:nil];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"begin");
    [self click];
    return NO;
}

-(void)calculate {
    [self handleError:@"计算"];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"Hello";
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
