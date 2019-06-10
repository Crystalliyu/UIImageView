//
//  ViewController.m
//  UIImageView
//
//  Created by 李玉卿 on 6/2/19.
//  Copyright © 2019 李玉卿. All rights reserved.
//


//图片地址：https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559468455301&di=f63553ec870dd346f6fc1f263bdab657&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201509%2F28%2F20150928233621_xvMAm.thumb.700_0.jpeg


#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//    set the UITextField.
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    text.delegate = self;
    text.tag = 101;
    text.textColor = [UIColor purpleColor];
    text.backgroundColor = [UIColor whiteColor];
    text.placeholder = @"Please enter the URL";
    [text becomeFirstResponder];
    text.keyboardType = UIKeyboardTypeURL;
    text.returnKeyType =UIReturnKeyGo;
    

    [self.view addSubview:text];
    
    
//    NSString *path = @"/Users/liyuqing/Desktop/Krystal.jpeg";
//    UIImage *image1 = [[UIImage alloc]initWithContentsOfFile:imageFilePath];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 200, 355, 400)];
//    imageView.frame = CGRectMake(10 , 200, 355,400);
    imageView.tag = 200;
    imageView.backgroundColor = [UIColor purpleColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [imageView sizeToFit];
    
    [self.view addSubview:imageView];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
//    UITextField *text = [self.view viewWithTag:101];
    NSLog(@"所输入的内容为:%@",textField.text);
    NSString *urlString = textField.text;  //这里获得了URL；
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:urlString]];
    UIImage *image = [UIImage imageWithData:data];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *imageFilePath = [path stringByAppendingPathComponent:@"MyImage"];
    BOOL success = [UIImageJPEGRepresentation(image, 0.5) writeToFile:imageFilePath  atomically:YES];
    if (success){
        NSLog(@"写入本地成功");
    }
    UIImage *image1 = [[UIImage alloc]initWithContentsOfFile:imageFilePath];
    UIImageView *imageView = [self.view viewWithTag:200];
    [imageView setImage:image1];
    return YES;
    
}

@end
