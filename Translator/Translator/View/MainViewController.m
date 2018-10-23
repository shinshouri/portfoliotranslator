//
//  MainViewController.m
//  Translator
//
//  Created by a on 22/10/18.
//  Copyright © 2018 TMS. All rights reserved.
//

#import "MainViewController.h"
#import "ImageCell.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    UIScrollView *bgview;
    UIView *ads, *detail, *view1, *view2;
    NSMutableArray *listHistory, *listHistorySearch, *listHistoryResult;
    NSArray *lang, *langCode;
    UIPickerView *picker1, *picker2;
    UIImageView *img1, *img2;
    UILabel *lbl1, *lbl21;
    UITextView *txt1, *lbl22;
    NSString *langCode1, *langCode2;
    UITableView *table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [defaults removeObjectForKey:@"ListHistorySearch"];
//    [defaults removeObjectForKey:@"ListHistoryResult"];
    listHistory = [[NSMutableArray alloc] init];
    if ([defaults objectForKey:@"ListHistory"]) {
        listHistory = [[defaults objectForKey:@"ListHistory"] mutableCopy];
    }
    lang = [[NSArray alloc] initWithObjects:@"Afrikaans", @"Albanian", @"Amharic", @"Arabic", @"Armenian", @"Azeerbaijani", @"Basque", @"Belarusian", @"Bengali", @"Bosnian", @"Bulgarian", @"Catalan", @"Cebuano", @"Chinese (Simplified)", @"Chinese (Traditional)", @"Corsican", @"Croatian", @"Czech", @"Danish", @"Dutch", @"English", @"Esperanto", @"Estonian", @"Finnish", @"French", @"Frisian", @"Galician", @"Georgian", @"German", @"Greek", @"Gujarati", @"Haitain Creole", @"Hausa", @"Hawaiian", @"Hebrew", @"Hindi", @"Hmong", @"Hungarian", @"Icelandic", @"Igbo", @"Indonesian", @"Irish", @"Italian", @"Japanese", @"Javanese", @"Kannada", @"Kazakh", @"Khmer", @"Korean", @"Kurdish", @"Kyrgyz", @"Lao", @"Latin", @"Latvian", @"Lithuanian", @"Luxembourgish", @"Macedonian", @"Malagasy", @"Malay", @"Malayalam", @"Maltese", @"Maori", @"Marathi", @"Mongolian", @"Myanmar(Burmese)", @"Nepali", @"Norwegian", @"Nyanja(Chichewa)", @"Pashto", @"Persian", @"Polish", @"Portuguese", @"Punjabi", @"Romanian", @"Russian", @"Samoan", @"Scots Gaelic", @"Serbian", @"Sesotho", @"Shona", @"Sindhi", @"Sinhala(Sinhalese)", @"Slovak", @"Slovenian", @"Somali", @"Spanish", @"Sundanese", @"Swahili", @"Swedish", @"Tagalog(Filipino)", @"Tajik", @"Tamil", @"Telugu", @"Thai", @"Turkish", @"Ukrainian", @"Urdu", @"Uzbek", @"Vietnamese", @"Welsh", @"Xhosa", @"Yiddish", @"Yoruba", @"Zulu", nil];
    langCode = [[NSArray alloc] initWithObjects:@"af", @"sq", @"am", @"ar", @"hy", @"az", @"eu", @"be", @"bn", @"bs", @"bg", @"ca", @"ceb", @"zh-CN", @"zh-TW", @"co", @"hr", @"cs", @"da", @"nl", @"en", @"eo", @"et", @"fi", @"fr", @"fy", @"gl", @"ka", @"de", @"el", @"gu", @"ht", @"ha", @"haw", @"he**", @"hi", @"hmn", @"hu", @"is", @"ig", @"id", @"ga", @"it", @"ja", @"jw", @"kn", @"kk", @"km", @"ko", @"ku", @"ky", @"lo", @"la", @"lv", @"lt", @"lb", @"mk", @"mg", @"ms", @"ml", @"mt", @"mi", @"mr", @"mn", @"my", @"ne", @"no", @"ny", @"ps", @"fa", @"pl", @"pt", @"pa", @"ro", @"ru", @"sm", @"gd", @"sr", @"st", @"sn", @"sd", @"si", @"sk", @"sl", @"so", @"es", @"su", @"sw", @"sv", @"tl", @"tg", @"ta", @"te", @"th", @"tr", @"uk", @"ur", @"uz", @"vi", @"cy", @"xh", @"yi", @"yo", @"zu", nil];
    
    [self UI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)UI {
    [bgview removeFromSuperview];
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [bgview setContentSize:CGSizeMake(0, 500)];
    
    [bgview addSubview:[self UIImage:self withFrame:CGRectMake((WIDTH/2)-(WIDTH/8)-30, 30, 20, 20) withImageName:@"logo_small"]];
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake((WIDTH/2)-(WIDTH/8), 30, WIDTH/2, 20) withText:@"Translate App" withTextSize:18 withAlignment:0 withLines:0]];
    
    view1 = [self UIView:self withFrame:CGRectMake(10, 70, WIDTH-20, HEIGHT/4)];
    [view1 setBackgroundColor:[UIColor whiteColor]];
    [[view1 layer] setCornerRadius:10];
    
    img1 = [self UIImage:self withFrame:CGRectMake(10, 10, 25, 25) withImageName:@"star yellow"];
    [view1 addSubview:img1];
    lbl1 = [self UILabel:self withFrame:CGRectMake(img1.frame.origin.x+img1.frame.size.width+10, img1.frame.origin.y, WIDTH-img1.frame.size.width, img1.frame.size.height) withText:@"" withTextSize:16 withAlignment:0 withLines:0];
    [view1 addSubview:lbl1];
    [view1 addSubview:[self UIImage:self withFrame:CGRectMake((WIDTH/2)+10, 18, 20, 10) withImageName:@"drop arrow"]];
    [view1 addSubview:[self UIButton:self withFrame:CGRectMake(lbl1.frame.origin.x, lbl1.frame.origin.y, lbl1.frame.size.width, lbl1.frame.size.height) withTitle:@"" withTag:1]];
    
    txt1 = [self UITextView:self withFrame:CGRectMake(img1.frame.origin.x, img1.frame.origin.y+img1.frame.size.height+10, view1.frame.size.width-20, view1.frame.size.height/2) withText:@"Write Something" withSize:20 withInputType:UIKeyboardTypeDefault];
    [txt1 setReturnKeyType:UIReturnKeyGo];
    [txt1 setTag:1];
    [view1 addSubview:txt1];
    [bgview addSubview: view1];
    
    view2 = [self UIView:self withFrame:CGRectMake(10, view1.frame.origin.y+view1.frame.size.height+10, WIDTH-20, HEIGHT/4)];
    [view2 setBackgroundColor:[UIColor whiteColor]];
    [[view2 layer] setCornerRadius:10];
    
    img2 = [self UIImage:self withFrame:CGRectMake(10, 10, 25, 25) withImageName:@"star yellow"];
    [view2 addSubview:img2];
    lbl21 = [self UILabel:self withFrame:CGRectMake(img2.frame.origin.x+img2.frame.size.width+10, img2.frame.origin.y, WIDTH-img2.frame.size.width, img2.frame.size.height) withText:@"" withTextSize:16 withAlignment:0 withLines:0];
    [view2 addSubview:lbl21];
    [view2 addSubview:[self UIImage:self withFrame:CGRectMake((WIDTH/2)+10, 18, 20, 10) withImageName:@"drop arrow"]];
    [view2 addSubview:[self UIButton:self withFrame:CGRectMake(lbl21.frame.origin.x, lbl21.frame.origin.y, lbl21.frame.size.width, lbl21.frame.size.height) withTitle:@"" withTag:2]];
    
    lbl22 = [self UITextView:self withFrame:CGRectMake(img2.frame.origin.x, img2.frame.origin.y+img2.frame.size.height+10, view2.frame.size.width-20, view2.frame.size.height/2) withText:@"" withSize:20 withInputType:UIKeyboardTypeDefault];
    [lbl22 setEditable:NO];
    [lbl22 setSelectable:NO];
//    lbl22 = [self UILabel:self withFrame:CGRectMake(img2.frame.origin.x, img2.frame.origin.y+img2.frame.size.height+10, view2.frame.size.width-20, view2.frame.size.height/2) withText:@"" withTextSize:20 withAlignment:0 withLines:0];
    [view2 addSubview:lbl22];
    [bgview addSubview:view2];
    
    UIButton *swap = [self UIButton:self withFrame:CGRectMake((WIDTH/2)-45, view1.frame.origin.y+view1.frame.size.height-45, 80, 80) withTitle:@"" withTag:3];
    [swap setImage:[UIImage imageNamed:@"switch button"] forState:UIControlStateNormal];
//    [swap sizeToFit];
    [bgview addSubview:swap];
    
    [bgview addSubview:[self UILabelwithBlackText:self withFrame:CGRectMake(10, view2.frame.origin.y+view2.frame.size.height+10, WIDTH-20, 50) withText:@"History" withTextSize:16 withAlignment:0 withLines:0]];
    
    table = [self UITableView:self withFrame:CGRectMake(10, view2.frame.origin.y+view2.frame.size.height+70, WIDTH-20, HEIGHT-(view2.frame.origin.y+view2.frame.size.height+80)) withStyle:0];
    [table setBackgroundColor:[UIColor clearColor]];
    [bgview addSubview: table];
    
    [bgview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToGesture)]];
    [[self view] addSubview:bgview];
    
    [picker1 removeFromSuperview];
    picker1 = [self UIPickerView:self withFrame:CGRectMake(0, HEIGHT-200, WIDTH, 200) withTag:1];
    [picker1 setHidden:YES];
    [[self view] addSubview: picker1];
    
    [picker2 removeFromSuperview];
    picker2 = [self UIPickerView:self withFrame:CGRectMake(0, HEIGHT-200, WIDTH, 200) withTag:2];
    [picker2 setHidden:YES];
    [[self view] addSubview: picker2];
}

-(void)Act:(id)sender {
    if([sender tag] == 1)
    {
        [[self view] endEditing:YES];
        [picker1 setHidden:NO];
        [picker2 setHidden:YES];
    }
    else if([sender tag] == 2)
    {
        [[self view] endEditing:YES];
        [picker1 setHidden:YES];
        [picker2 setHidden:NO];
    }
    else if([sender tag] == 3)
    {
//        NSString *swap1 = [lbl1 text];
//        NSString *swap2 = [lbl21 text];
//        NSString *codeswap1 = langCode1;
//        NSString *codeswap2 = langCode2;
//        NSString *result1 = [txt1 text];
//        NSString *result2 = [lbl22 text];
//        [lbl1 setText:swap2];
//        [lbl21 setText:swap1];
//        langCode1 = codeswap2;
//        langCode2 = codeswap1;
//        [txt1 setText:result2];
//        [lbl22 setText:result1];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //code with animation
            CGRect viewone = self->view1.frame;
            CGRect viewtwo = self->view2.frame;
            self->view1.frame = viewtwo;
            self->view2.frame = viewone;
            [self->view1 layoutIfNeeded];
            [self->view2 layoutIfNeeded];
        } completion:^(BOOL finished) {
            //code for completion
            CGRect viewone = self->view1.frame;
            CGRect viewtwo = self->view2.frame;
            self->view1.frame = viewtwo;
            self->view2.frame = viewone;
            NSString *swap1 = [self->lbl1 text];
            NSString *swap2 = [self->lbl21 text];
            NSString *codeswap1 = self->langCode1;
            NSString *codeswap2 = self->langCode2;
            NSString *result1 = [self->txt1 text];
            NSString *result2 = [self->lbl22 text];
            [self->lbl1 setText:swap2];
            [self->lbl21 setText:swap1];
            self->langCode1 = codeswap2;
            self->langCode2 = codeswap1;
            [self->txt1 setText:result2];
            [self->lbl22 setText:result1];
        }];
    }
    else if([sender tag] == 4)
    {
        [ads removeFromSuperview];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=284417350&mt=8&uo=6"] options:@{} completionHandler:nil];
    }
}

-(void)respondToGesture {
    [[self view] endEditing:YES];
    [picker1 setHidden:YES];
    [picker2 setHidden:YES];
    [detail removeFromSuperview];
}

-(void)showDetail:(NSIndexPath*)index {
    detail = [self UIView:self withFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [detail setBackgroundColor:[self transparentBlack]];
    
    UIView *viewd = [self UIView:self withFrame:CGRectMake(10, 70, WIDTH-20, HEIGHT/4)];
    [viewd setBackgroundColor:[UIColor whiteColor]];
    
//    [view1 addSubview:[self UIImage:self withFrame:CGRectMake(10, 10, 25, 25) withImageName:@"star yellow"]];
//    [view1 addSubview:[self UILabel:self withFrame:CGRectMake(img1.frame.origin.x+img1.frame.size.width+10, img1.frame.origin.y, WIDTH-img1.frame.size.width, img1.frame.size.height) withText:[lbl1 text] withTextSize:16 withAlignment:0 withLines:0]];
//    [view1 addSubview:[self UIButton:self withFrame:CGRectMake(lbl1.frame.origin.x, lbl1.frame.origin.y, lbl1.frame.size.width, lbl1.frame.size.height) withTitle:@"" withTag:1]];
    
    [viewd addSubview:[self UILabel:self withFrame:CGRectMake(img1.frame.origin.x, img1.frame.origin.y+img1.frame.size.height+10, viewd.frame.size.width-20, viewd.frame.size.height/2) withText:[[listHistory objectAtIndex:[index row]] objectForKey:@"Search"] withTextSize:20 withAlignment:0 withLines:0]];
    [detail addSubview: viewd];
    
    UIView *viewd2 = [self UIView:self withFrame:CGRectMake(10, viewd.frame.origin.y+viewd.frame.size.height+10, WIDTH-20, HEIGHT/4)];
    [viewd2 setBackgroundColor:[UIColor whiteColor]];
    
//    [view2 addSubview:[self UIImage:self withFrame:CGRectMake(10, 10, 25, 25) withImageName:@"star yellow"]];
//    [view2 addSubview:[self UILabel:self withFrame:CGRectMake(img2.frame.origin.x+img2.frame.size.width+10, img2.frame.origin.y, WIDTH-img2.frame.size.width, img2.frame.size.height) withText:[lbl21 text] withTextSize:16 withAlignment:0 withLines:0]];
//    [view2 addSubview:[self UIButton:self withFrame:CGRectMake(lbl21.frame.origin.x, lbl21.frame.origin.y, lbl21.frame.size.width, lbl21.frame.size.height) withTitle:@"" withTag:2]];
    
    [viewd2 addSubview:[self UILabel:self withFrame:CGRectMake(img2.frame.origin.x, img2.frame.origin.y+img2.frame.size.height+10, viewd2.frame.size.width-20, viewd2.frame.size.height/2) withText:[[listHistory objectAtIndex:[index row]] objectForKey:@"Result"] withTextSize:20 withAlignment:0 withLines:0]];
    [detail addSubview:viewd2];
    
    [detail addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToGesture)]];
    [[self view] addSubview:detail];
}

-(void)showAds {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://upload.wikimedia.org/wikipedia/commons/b/b3/Campania_banner_View_from_Capri.jpg"]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->ads removeFromSuperview];
            self->ads = [self UIView:self withFrame:CGRectMake(0, HEIGHT-150, WIDTH, 150)];
            UIImageView *imgads = [self UIImage:self withFrame:CGRectMake(0, 0, WIDTH, self->ads.frame.size.height) withImageName:@"logo_small"];
            imgads.image = [UIImage imageWithData:data];
            [self->ads addSubview:imgads];
            [self->ads addSubview:[self UIButton:self withFrame:CGRectMake(WIDTH-40, 0, 40,40) withTitle:@"X" withTag:4]];
            
            [[self view] addSubview:self->ads];
        });
    });
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listHistory count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.mainLabel.text = [[listHistory objectAtIndex:[indexPath row]] objectForKey:@"Search"];
    cell.descriptionLabel.text = [[listHistory objectAtIndex:[indexPath row]] objectForKey:@"Result"];
//    cell.img.image = [UIImage imageNamed:@"star outline_small"];
//    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.borderWidth = 5;
    cell.layer.borderColor = [self colorFromHexString:Color3 withAlpha:1.0].CGColor;
    cell.layer.cornerRadius = 10;
    cell.clipsToBounds = TRUE;
    
    return cell;
}

#pragma mark - Tableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showDetail:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    // space between cells
//    return 5;
//}

#pragma mark - Pickerview Delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([pickerView tag] == 1)
    {
        return [lang count];
    }
    else if([pickerView tag] == 2)
    {
        return [lang count];
    }
    
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if ([pickerView tag] == 1)
    {
        return [lang objectAtIndex:row];
    }
    else if ([pickerView tag] == 2)
    {
        return [lang objectAtIndex:row];
    }
    
    return 0;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if ([pickerView tag] == 1)
    {
        if ([pickerView selectedRowInComponent:0] == row) {
            
        }
        [lbl1 setText:[lang objectAtIndex:row]];
        langCode1 = [langCode objectAtIndex:row];
    }
    else if ([pickerView tag] == 2)
    {
        [lbl21 setText:[lang objectAtIndex:row]];
        langCode2 = [langCode objectAtIndex:row];
    }
//    [picker removeFromSuperview];
}

#pragma mark - TextView Delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self RequestData:self];
    }
    
    return textView.text.length + (text.length - range.length) <= 85;
}

#pragma mark - API
-(void)RequestData:(id)sender {
    @try {
        [picker1 setHidden:YES];
        [picker2 setHidden:YES];
        [[self view] endEditing:YES];
        [[self view] addSubview:[self showmask]];
        response = nil;
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[txt1 text], @"text", langCode1, @"from", langCode2, @"to", nil];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
            
            NSURL * url = [NSURL URLWithString:@"http://47.75.13.70/translate/translate.php"];
            NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
            NSString * paramstr = [NSString stringWithFormat:@"text=%@&from=%@&to=%@", [params objectForKey:@"text"], [params objectForKey:@"from"], [params objectForKey:@"to"]];
            [urlRequest setHTTPMethod:@"POST"];
            [urlRequest setHTTPBody:[paramstr dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *responses, NSError *error)
            {
                NSLog(@"Response:%@ %@\n", responses, error);
                if(error == nil)
                {
                    self->response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                    NSLog(@"%@", [[self->response objectForKey:@"result"] objectForKey:@"text"]);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self->maskView removeFromSuperview];
                        [self->lbl22 setText:[[self->response objectForKey:@"result"] objectForKey:@"text"]];
                        if (![[self->lbl22 text] isEqualToString:[self->txt1 text]])
                        {
                            NSDictionary *dictHist = [NSDictionary dictionaryWithObjectsAndKeys:[self->txt1 text], @"Search", [self->lbl22 text], @"Result", nil];
                            if ([self->listHistory count] >= 9) {
                                [self->listHistory removeObjectAtIndex:9];
                            }
                            [self->listHistory insertObject:dictHist atIndex:0];
                            [self->defaults setObject:self->listHistory forKey:@"ListHistory"];
                            [self->table reloadData];
                        }
                    });
                }
            }];
        [dataTask resume];
        });
    } @catch(NSException *exception) {
        
    }
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
