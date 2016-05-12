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
#import "UIButton+Selector.h"
#define APP_BASIC_FONT_NAME @"Avenir-Book"

#define APP_BASIC_FONT_SIZE 14.0f
#define TEXT_FIELD_FONT_SIZE 16.0f
#define NUMBERS @"0123456789."

@interface CalculatorViewController () <UITextFieldDelegate>
@property(nonatomic, strong) UILabel *huankuanfangshiLabel;//还款方式
@property(nonatomic, strong) UILabel *priceLabel;//单价
@property(nonatomic, strong) UILabel *areaLabel;//面积
@property(nonatomic, strong) UILabel *shouFuChengShuLabel;//首付成数
@property(nonatomic, strong) UILabel *daikuanqixianLabel;//贷款期限
@property(nonatomic, strong) UILabel *nianlilvLabel;//年利率
@property(nonatomic, strong) UILabel *lilvzhekouLabel;//利率折扣

@property(nonatomic, strong) UILabel *daikuanzongeLabel;//贷款总额
@property(nonatomic, strong) UILabel *huankuanyueshuLabel;//还款月数
@property(nonatomic, strong) UILabel *meiyuehuankuanLabel;//每月还款
@property(nonatomic, strong) UILabel *zonglixiLabel;//总支付利息
@property(nonatomic, strong) UILabel *benxihejiLabel;//本息合计

@property(nonatomic, strong) UILabel *daikuanzongeContent;
@property(nonatomic, strong) UILabel *huankuanyueshuContent;
@property(nonatomic, strong) UILabel *meiyuehuankuanContent;
@property(nonatomic, strong) UILabel *zonglixiContent;
@property(nonatomic, strong) UILabel *benxihejiContent;

@property(nonatomic, strong) UIButton *calculateButton;//计算按钮

@property(nonatomic, strong) UITextField *huankuanfangshiUITextField;//还款方式输入
@property(nonatomic, strong) UITextField *shoufuchengshuUITextField;//首付成数输入
@property(nonatomic, strong) UITextField *daikuanqixianUITextField;//贷款期限输入
@property(nonatomic, strong) UITextField *lilvzhekouUITextField;//利率折扣输入

@property(nonatomic, strong) UITextField *priceUITextField;//单价输入
@property(nonatomic, strong) UITextField *areaUITextField;//面积输入
@property(nonatomic, strong) UITextField *nianlilvTUITextField;//年利率输入

@property(nonatomic, strong) NSArray *huankuanfangshiArrary;
@property(nonatomic, strong) NSArray *shoufuchengshuArrary;
@property(nonatomic, strong) NSArray *daikuanqixianArrary;
@property(nonatomic, strong) NSArray *lilvzhekouArrary;

@property(nonatomic, strong) UIAlertController *huankuanfangshiController;
@property(nonatomic, strong) UIAlertController *shoufuchengshuController;
@property(nonatomic, strong) UIAlertController *daikuanqixianController;
@property(nonatomic, strong) UIAlertController *lilvzhekouController;

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
    [self initDatas];
    [self initAlertController];
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
    self.huankuanfangshiUITextField = [self createTextFieldWithDefaultValue:@"等额本金" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    [self.view addSubview:self.huankuanfangshiLabel];
    [self.view addSubview:self.huankuanfangshiUITextField];
    self.nextViewStartY += viewHeight;
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.priceLabel.text = @"单价（元/平方米）";
    [self.priceLabel setFont:basicFont];
    self.priceUITextField = [self createTextFieldWithDefaultValue:@"" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.priceLabel];
    [self.view addSubview:self.priceUITextField];
    
    self.areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.areaLabel.text = @"面积（平方米）";
    [self.areaLabel setFont:basicFont];
    self.areaUITextField = [self createTextFieldWithDefaultValue:@"" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.areaLabel];
    [self.view addSubview:self.areaUITextField];
    
    
    self.shouFuChengShuLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.shouFuChengShuLabel.text = @"首付成数";
    [self.shouFuChengShuLabel setFont:basicFont];
    self.shoufuchengshuUITextField = [self createTextFieldWithDefaultValue:@"3成" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.shouFuChengShuLabel];
    [self.view addSubview:self.shoufuchengshuUITextField];
    
    self.daikuanqixianLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.daikuanqixianLabel.text = @"贷款期限";
    [self.daikuanqixianLabel setFont:basicFont];
    self.daikuanqixianUITextField = [self createTextFieldWithDefaultValue:@"15年" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.daikuanqixianLabel];
    [self.view addSubview:self.daikuanqixianUITextField];
    
    self.nianlilvLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.nianlilvLabel.text = @"年利率(%)";
    [self.nianlilvLabel setFont:basicFont];
    self.nianlilvTUITextField = [self createTextFieldWithDefaultValue:@"6.5" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.nianlilvLabel];
    [self.view addSubview:self.nianlilvTUITextField];
    
    self.lilvzhekouLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.lilvzhekouLabel.text = @"利率折扣";
    [self.lilvzhekouLabel setFont:basicFont];
    self.lilvzhekouUITextField = [self createTextFieldWithDefaultValue:@"9.5" rect:CGRectMake(leftWidth + leftMargin, self.nextViewStartY, rightWidth, viewHeight)];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.lilvzhekouLabel];
    [self.view addSubview:self.lilvzhekouUITextField];
    
    self.calculateButton = [[UIButton alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, SCREEN_WIDTH - leftMargin * 2, 48)];
    [self.calculateButton setTitle:@"计       算" forState:UIControlStateNormal];
    [self.calculateButton setSelector];
    [self.calculateButton setBackgroundColor:[UIColor redColor]];
    [self.calculateButton.layer setCornerRadius:5.0f];
    self.nextViewStartY += 48;
    [self.view addSubview:self.calculateButton];
    [self.calculateButton addTarget:self action:@selector(calculate) forControlEvents:UIControlEventTouchUpInside];
    
    self.daikuanzongeLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += (topMargin + 20), leftWidth, viewHeight)];
    self.daikuanzongeLabel.text = @"贷款总额：";
    [self.daikuanzongeLabel setFont:basicFont];
    self.daikuanzongeContent = [[UILabel alloc] initWithFrame:CGRectMake(leftWidth + leftMargin - 30, self.nextViewStartY, rightWidth, viewHeight)];
    [self.daikuanzongeContent setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.daikuanzongeLabel];
    [self.view addSubview:self.daikuanzongeContent];
    
    self.huankuanyueshuLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.huankuanyueshuLabel.text = @"还款月数：";
    [self.huankuanyueshuLabel setFont:basicFont];
    self.huankuanyueshuContent = [[UILabel alloc] initWithFrame:CGRectMake(leftWidth + leftMargin - 30, self.nextViewStartY, rightWidth, viewHeight)];
    [self.huankuanyueshuContent setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.huankuanyueshuLabel];
    [self.view addSubview:self.huankuanyueshuContent];
    
    self.meiyuehuankuanLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.meiyuehuankuanLabel.text = @"每月还款：";
    [self.meiyuehuankuanLabel setFont:basicFont];
    self.meiyuehuankuanContent = [[UILabel alloc] initWithFrame:CGRectMake(leftWidth + leftMargin - 30, self.nextViewStartY, rightWidth, viewHeight)];
    [self.meiyuehuankuanContent setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.meiyuehuankuanLabel];
    [self.view addSubview:self.meiyuehuankuanContent];
    
    self.zonglixiLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.zonglixiLabel.text = @"总支付利息：";
    [self.zonglixiLabel setFont:basicFont];
    self.zonglixiContent = [[UILabel alloc] initWithFrame:CGRectMake(leftWidth + leftMargin - 30, self.nextViewStartY, rightWidth, viewHeight)];
    [self.zonglixiContent setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.zonglixiLabel];
    [self.view addSubview:self.zonglixiContent];
    
    self.benxihejiLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.nextViewStartY += topMargin, leftWidth, viewHeight)];
    self.benxihejiLabel.text = @"本息合计：";
    [self.benxihejiLabel setFont:basicFont];
    self.benxihejiContent = [[UILabel alloc] initWithFrame:CGRectMake(leftWidth + leftMargin - 30, self.nextViewStartY, rightWidth, viewHeight)];
    [self.benxihejiContent setFont:basicFont];
    self.nextViewStartY += viewHeight;
    [self.view addSubview:self.benxihejiLabel];
    [self.view addSubview:self.benxihejiContent];

}

-(void) initDatas {
    self.huankuanfangshiArrary = [NSArray arrayWithObjects:@"等额本金", @"等额本息", nil];
    self.shoufuchengshuArrary = [NSArray arrayWithObjects:@"2成", @"3成", @"4成",@"5成",@"6成",@"7成",@"8成",@"9成",nil];
    self.daikuanqixianArrary = [NSArray arrayWithObjects:@"1年", @"2年",@"3年",@"4年",@"5年",@"10年",@"15年",@"20年",@"25年",@"30年", nil];
    self.lilvzhekouArrary = [NSArray arrayWithObjects:@"7.0", @"7.5",@"8.0",@"9.0",@"9.5",@"10.0", nil];
}

-(void) initAlertController {
    self.huankuanfangshiController = [self createAlertContollerWithTitle:@"还款方式" msg:nil actionTitles:self.huankuanfangshiArrary textFiled:self.huankuanfangshiUITextField];
    self.shoufuchengshuController = [self createAlertContollerWithTitle:@"首付成数" msg:nil actionTitles:self.shoufuchengshuArrary textFiled:self.shoufuchengshuUITextField];
    self.daikuanqixianController = [self createAlertContollerWithTitle:@"贷款期限" msg:nil actionTitles:self.daikuanqixianArrary textFiled:self.daikuanqixianUITextField];
    self.lilvzhekouController = [self createAlertContollerWithTitle:@"利率折扣" msg:nil actionTitles:self.lilvzhekouArrary textFiled:self.lilvzhekouUITextField];
}

-(void)clickWithTextFile:(UITextField*) textField {
    if(textField == self.huankuanfangshiUITextField) {
        [self presentViewController:self.huankuanfangshiController animated:true completion:nil];
        return;
    }
    if(textField == self.daikuanqixianUITextField) {
        [self presentViewController:self.daikuanqixianController animated:true completion:nil];
        return;
    }
    if(textField == self.shoufuchengshuUITextField) {
        [self presentViewController:self.shoufuchengshuController animated:true completion:nil];
        return;
    }
    if(textField == self.lilvzhekouUITextField) {
        [self presentViewController:self.lilvzhekouController animated:true completion:nil];
        return;
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"begin");
    [self clickWithTextFile:textField];
    if(textField == self.priceUITextField || textField == self.areaUITextField || textField == self.nianlilvTUITextField)
        return YES;
    return NO;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"string is %@", string);
    if(textField == self.priceUITextField || textField == self.nianlilvTUITextField || textField == self.areaUITextField) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if(!basicTest) {
           [self showAlert:@"请输入数字"];
            return NO;
        }
        return YES;
    }
    return NO;
}

//开始计算
-(void)calculate {
    //校验数据
    NSString* price = self.priceUITextField.text;
    NSString* area = self.areaUITextField.text;
    NSString* nianlilv = self.nianlilvTUITextField.text;
    if([self valiateNumbersStr:price] && [self valiateNumbersStr:area] && [self valiateNumbersStr:nianlilv]) {
        float priceValue = [price floatValue];
        float areaValue = [area floatValue];
        float nianlilvValue = [nianlilv floatValue] / 100;
        float lilvzhekouValue = [self.lilvzhekouUITextField.text floatValue];
        nianlilvValue = nianlilvValue * lilvzhekouValue / 10;//打折后利率
        int shoufuchengsuValue = [[self.shoufuchengshuUITextField.text substringToIndex:([self.shoufuchengshuUITextField.text length] - 1)] intValue];
        int daikuanqixianValue = [[self.daikuanqixianUITextField.text substringToIndex:([self.daikuanqixianUITextField.text length] - 1)] intValue];
        NSLog(@"%f %f %f %f %d %d", priceValue, areaValue, nianlilvValue, lilvzhekouValue, shoufuchengsuValue, daikuanqixianValue);
        NSString* huankuanfangshi = self.huankuanfangshiUITextField.text;
        
        float totalMoney = priceValue * areaValue;//房款总额
        float totalLoanMoney = totalMoney * (10 - shoufuchengsuValue) / 10;//总贷款金额
        float paymentPerMon = 0;//每月还款
        float decreasePerMon = 0;//每月递减
        float zonglixi = 0;//总利息
        float yuelilv = nianlilvValue / 12;//月利率
        
        if([huankuanfangshi isEqualToString:@"等额本金"]) {
            paymentPerMon = totalLoanMoney / (daikuanqixianValue * 12) + totalLoanMoney * (yuelilv);
            decreasePerMon = totalLoanMoney * yuelilv / (daikuanqixianValue * 12);
            zonglixi = paymentPerMon * daikuanqixianValue * 12 - totalLoanMoney;
            [self.meiyuehuankuanContent setText:[NSString stringWithFormat:@"%.2f元 每月递减：%@元", paymentPerMon, [NSString stringWithFormat:@"%.2f", decreasePerMon]]];
            [self.meiyuehuankuanLabel setText:@"首月还款"];
        } else {
            paymentPerMon = totalLoanMoney * (yuelilv) * powf(1 + yuelilv, daikuanqixianValue * 12) / (powf(1 + yuelilv, daikuanqixianValue * 12) - 1);
            zonglixi = paymentPerMon * daikuanqixianValue * 12 - totalLoanMoney;
            [self.meiyuehuankuanContent setText:[NSString stringWithFormat:@"%.2f元", paymentPerMon]];
            [self.meiyuehuankuanLabel setText:@"每月还款"];
        }
        
        [self.daikuanzongeContent setText:[NSString stringWithFormat:@"%.2f元", totalLoanMoney]];
        [self.huankuanyueshuContent setText:[NSString stringWithFormat:@"%d月", daikuanqixianValue * 12]];
        [self.zonglixiContent setText:[NSString stringWithFormat:@"%.2f元", zonglixi]];
        [self.benxihejiContent setText:[NSString stringWithFormat:@"%.2f元", (zonglixi + totalLoanMoney)]];
    } else {
        [self showAlert:@"输入数据格式错误"];
    }
}

//验证
-(BOOL) valiateNumbersStr:(NSString*) string {
    NSString *regex = @"^[1-9]\\d*(\\.\\d+)?$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:string];
    return isValid;
}

-(void) showAlert: (NSString*) msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

//创建alertController
-(UIAlertController*) createAlertContollerWithTitle:(NSString*) alertTitle msg:(NSString*) msg actionTitles:(NSArray*) actionTitles textFiled:(UITextField*) targetTextField {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    for(int i = 0; i < [actionTitles count]; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:[actionTitles objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            targetTextField.text = [actionTitles objectAtIndex:i];
        }];
        [alertController addAction:action];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [alertController addAction:cancelAction];
    return alertController;
}

//创建TextFiled
-(UITextField*) createTextFieldWithDefaultValue:(NSString*) value rect:(CGRect) rect{
    UITextField* textField = [[UITextField alloc] initWithFrame:rect];
    [textField setText:value];
    [textField setFont:[UIFont fontWithName:APP_BASIC_FONT_NAME size:TEXT_FIELD_FONT_SIZE]];
    [textField setTextAlignment:NSTextAlignmentLeft];
    [textField setDelegate:self];
    return textField;
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
