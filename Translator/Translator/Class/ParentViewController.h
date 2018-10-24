//
//  ViewController.h
//
//  Created by MC on 6/19/15.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "KeyChainStore.h"

#define DEVICEID [self getDeviceID]
#define DEVICETOKEN [defaults objectForKey:@"ApnsDeviceToken"]

#define WIDTH [self view].frame.size.width
#define HEIGHT [self view].frame.size.height
#define btnmarginleft 20
#define btnheight 45
#define textsize12 12
#define textsize14 14
#define textsize16 16
#define textsize18 18
#define textsize20 20
#define textsize24 24
#define Colorm1 @"#F9F9F9" //(249,249,249)
#define Color0 @"#FFFFFF"
#define Color1 @"#136286" //navigation(19,98,134)
#define Color2 @"#2D2D2D" //label(45,45,45)
#define Color3 @"#21A1CC" //button(33,161,204)
#define Color4 @"#9B9B9B" //textlabel(155,155,155)
#define Color5 @"#216BA4" //(33,107,164)
#define Color6 @"#083f7b" //(8,62,123)
#define Color7 @"#6E6E6E" //textfield(110,110,110)
#define Color8 @"#CACACA" //textplaceholder(202,202,202)
#define Color9 @"#EBEBEB" //(235,235,235)
#define Color10 @"#20C3DC" //itemtabbar(32, 195, 220)
#define Color11 @"#0B8CED" //(11, 140, 237)

//Language
#define History [[defaults objectForKey:@"language"] isEqualToString:@"id"] ? @"Sejarah" : @"History"

//Static Message
#define MSGResponseNil L(@"connectionTimeout")

@interface ParentViewController : UIViewController <UITextFieldDelegate>
{
    NSUserDefaults *defaults;
    UITapGestureRecognizer *tapRecognizer;
    NSDictionary *response;
    UIView *maskView, *maskProgressView, *redAlert;
    UIImageView *bgimage;
    int secondsLeft;
    NSTimer *timer;
    UIProgressView *progressView;
}

@property (strong, nonatomic) UIWindow *window;
//UI
-(UIView*)UIView:(id)sender withFrame:(CGRect)frame;
-(UIImageView*)UIImage:(id)sender withFrame:(CGRect)frame withImageName:(NSString *)name;
-(UIImageView*)UIImageGIF:(id)sender withFrame:(CGRect)frame withImageName:(NSString*)name;
-(UILabel*)UILabel:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line;
-(UILabel*)UILabelwithWhiteText:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line;
-(UILabel*)UILabelwithBlackText:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line;
-(UITextField*)UITextField:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withSize:(int)size withInputType:(UIKeyboardType)input withSecure:(int)sec;
-(UITextView*)UITextView:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withSize:(int)size withInputType:(UIKeyboardType)input;
-(UIButton*)UIButton:(id)sender withFrame:(CGRect)frame withTitle:(NSString*)title withTag:(int)tag;
-(UITableView*)UITableView:(id)sender withFrame:(CGRect)frame withStyle:(int)tablestyle;
-(UIPickerView *)UIPickerView:(id)sender withFrame:(CGRect)frame withTag:(NSInteger)tag;
-(UISwitch *)UISwitch:(id)sender withFrame:(CGRect)frame;
-(void)UILine:(id)sender :(CGRect)frame;

//Customize
-(UIScrollView *) ScrollViewWithButton:(int)btn kolom:(int)column baris:(int)row buttonsize:(int)size withx:(int)x withy:(int)y withwidth:(int)lebar withheight:(int)tinggi withimg:(NSArray*)img withlabel:(NSArray*)label;
-(UIScrollView *) ScrollViewWithImage:(NSArray*)img withx:(int)x withy:(int)y withwidth:(int)lebar withheight:(int)tinggi;

- (UIColor *)transparentBlack;
-(UIColor *)colorFromHexString:(NSString *)hexString withAlpha:(CGFloat)alpha;
-(UIView *)showProgressbar;
- (UIView *)showmask;
-(void)SendSMS:(id)sender withText:(NSString*)text withPhoneNumber:(NSString*)phonenumber;
- (UIViewController*)topViewController;
-(void)GotoPage:(id)sender withIdentifier:(NSString*)Identifier;
-(BOOL)IsValidEmail:(NSString *)checkString;
-(NSString*)getDeviceID;


-(NSString*)encryptHSM:(NSString*)values withRNumber:(NSString*)rnmbr withVal:(NSString*)val withExpo:(NSString*)expo;
-(NSString*)encryptHSMPIN:(NSString*)value1 :(NSString*)value2 withRNumber:(NSString*)rnmbr withVal:(NSString*)val withExpo:(NSString*)expo;

//Formatter
-(NSString*)FormatNumber:(id)sender from:(NSString*)value;
-(NSString*)FormatDate:(id)sender from:(NSDate*)date withFormat:(NSString*)format;

//Alert
-(void)showAlert:(NSString*)alertMessage title:(NSString*)title btn:(NSString*)btn tag:(int)tag delegate:(id)delegate;
-(void)showAlert2:(NSString*)alertMessage title:(NSString*)title btn1:(NSString*)btn1 btn2:(NSString*)btn2 tag:(int)tag delegate:(id)delegate;
-(void)copyright:(id)delegate :(NSString*)A :(NSString*)B;

//Networking
//-(NSDictionary*)RequestData:(id)sender withParams:(NSDictionary *)params;

//EDITING
-(NSString*)RandomNumber:(int)digit;
-(NSString*)OjdfAjidfmsdpaA:(NSString*)ext :(NSString*)rn;
-(NSString*)QsCFtGbHyUJSdaWE;

@end

