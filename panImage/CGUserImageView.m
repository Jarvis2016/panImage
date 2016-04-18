//
//  CGUserImageView.m
//  panImage
//
//  Created by jjw on 16/4/18.
//  Copyright © 2016年 jjw. All rights reserved.
//

#import "CGUserImageView.h"
#import "UIImageView+WebCache.h"
#define SCREEN_WidthSmall   [UIScreen mainScreen].bounds.size.width/3
#define ViewBorder(View, BorderColor, BorderWidth )\
\
View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;
@implementation CGUserImageView
-(id)initWithFrame:(CGRect)frame
{//照片展示区是正方形的；
    self=[super initWithFrame:frame];
    if (self) {
        
        _headerImageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2)];
        //        _headerImageV.backgroundColor=[UIColor redColor];
        _headerImageV.tag=10;
        [self addSubview:_headerImageV];
        _OneImageV=[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width*2/3, 0, frame.size.width/3, frame.size.height/3)];
        [self addSubview:_OneImageV];
        _OneImageV.tag=11;
        //        _OneImageV.backgroundColor=[UIColor blackColor];
        _TwoImageV=[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width*2/3, frame.size.width/3, frame.size.width/3, frame.size.height/3)];
        [self addSubview:_TwoImageV];
        _TwoImageV.tag=12;
        //        _TwoImageV.backgroundColor=[UIColor yellowColor];
        _ThreeImageV=[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width*2/3, frame.size.width*2/3, frame.size.width/3, frame.size.height/3)];
        [self addSubview:_ThreeImageV];
        _ThreeImageV.tag=13;
        //        _ThreeImageV.backgroundColor=[UIColor purpleColor];
        _fourImageV=[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/3, frame.size.width*2/3, frame.size.width/3, frame.size.height/3)];
        [self addSubview:_fourImageV];
        _fourImageV.tag=14;
        //        _fourImageV.backgroundColor=[UIColor greenColor];
        _fiveImageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, frame.size.width*2/3, frame.size.width/3, frame.size.height/3)];
        [self addSubview:_fiveImageV];
        _fiveImageV.tag=15;
        //        _fiveImageV.backgroundColor=[UIColor darkTextColor];
        ViewBorder(_headerImageV, [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1], 0.5);
        ViewBorder(_OneImageV, [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1], 0.5);
        ViewBorder(_TwoImageV, [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1], 0.5);
        ViewBorder(_ThreeImageV, [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1], 0.5);
        ViewBorder(_fourImageV, [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1], 0.5);
        ViewBorder(_fiveImageV, [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1], 0.5);
        _btnHeader=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnHeader.frame=CGRectMake(SCREEN_WidthSmall-20, SCREEN_WidthSmall-20, 40, 40);
        
        [_btnHeader setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self addSubview:_btnHeader];
        
        _btnOne=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnOne.frame=CGRectMake(SCREEN_WidthSmall/2-20+SCREEN_WidthSmall*2, SCREEN_WidthSmall/2-20, 40, 40);
        [_btnOne setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self addSubview:_btnOne];
        _btnTwo=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnTwo.frame=CGRectMake(SCREEN_WidthSmall/2-20+SCREEN_WidthSmall*2, SCREEN_WidthSmall/2-20+SCREEN_WidthSmall, 40, 40);
        [_btnTwo setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self addSubview:_btnTwo];
        _btnThree=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnThree.frame=CGRectMake(SCREEN_WidthSmall/2-20+SCREEN_WidthSmall*2, SCREEN_WidthSmall/2-20+SCREEN_WidthSmall*2, 40, 40);
        [_btnThree setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self addSubview:_btnThree];
        _btnfour=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnfour.frame=CGRectMake(SCREEN_WidthSmall/2-20+SCREEN_WidthSmall, SCREEN_WidthSmall/2-20+SCREEN_WidthSmall*2, 40, 40);
        [_btnfour setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self addSubview:_btnfour];
        _btnfive=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnfive.frame=CGRectMake(SCREEN_WidthSmall/2-20, SCREEN_WidthSmall/2-20+SCREEN_WidthSmall*2, 40, 40);
        [_btnfive setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self addSubview:_btnfive];
        
        
        
        
    }
    return self;
}
-(void)resetSubImagesWithImageArr:(NSArray*)imagesArr
{
    for (UIImageView*imgV in self.subviews) {
        if (CGRectContainsRect(imgV.frame,CGRectMake(0, 0, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2))) {
            imgV.tag=10;
        }else if (CGRectContainsRect(imgV.frame,CGRectMake(SCREEN_WidthSmall*2, 0, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2))){
            imgV.tag=11;
        }else if (CGRectContainsRect(imgV.frame,CGRectMake(SCREEN_WidthSmall*2, SCREEN_WidthSmall, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2))){
            imgV.tag=12;
        }else if (CGRectContainsRect(imgV.frame,CGRectMake(SCREEN_WidthSmall*2, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2))){
            imgV.tag=13;
        }else if (CGRectContainsRect(imgV.frame,CGRectMake(SCREEN_WidthSmall, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2))){
            imgV.tag=14;
        }else if (CGRectContainsRect(imgV.frame,CGRectMake(0, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2, SCREEN_WidthSmall*2))){
            imgV.tag=15;
        }
    }
    if (imagesArr.count==0||imagesArr==nil) {
        
    }
    UIImageView*imageheader=[self viewWithTag:10];
    UIImageView*imageOne=[self viewWithTag:11];
    UIImageView*imagetwo=[self viewWithTag:12];
    UIImageView*imageThree=[self viewWithTag:13];
    UIImageView*imageFour=[self viewWithTag:14];
    UIImageView*imagefive=[self viewWithTag:15];
    _btnHeader.hidden=NO;
    _btnOne.hidden=NO;
    _btnTwo.hidden=NO;
    _btnThree.hidden=NO;
    _btnfour.hidden=NO;
    _btnfive.hidden=NO;
    _headerImageV.image=nil;
    _OneImageV.image=nil;_TwoImageV.image=nil;_ThreeImageV.image=nil;
    _fourImageV.image=nil;_fiveImageV.image=nil;
    if (imagesArr.count>0) {
        switch (imagesArr.count) {
            case 1:{
                _btnHeader.hidden=YES;
                
                id image=imagesArr[0];
                
                if ([image isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageheader sd_setImageWithURL:[NSURL URLWithString:image]];
                    
                }else if ([image isKindOfClass:[UIImage class]]){
                    //image
                    imageheader.image=image;
                }
                
                
            }
                
                break;
            case 2:{
                _btnHeader.hidden=YES;
                _btnOne.hidden=YES;
                id image=imagesArr[0];
                if ([image isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageheader sd_setImageWithURL:[NSURL URLWithString:image]];
                }else if ([image isKindOfClass:[UIImage class]]){
                    //image
                    imageheader.image=image;
                }
                id image1=imagesArr[1];
                if ([image1 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageOne sd_setImageWithURL:[NSURL URLWithString:image1]];
                }else if ([image1 isKindOfClass:[UIImage class]]){
                    //image
                    imageOne.image=image1;
                }
                
            }
                
                break;
            case 3:{
                _btnHeader.hidden=YES;
                _btnOne.hidden=YES;
                _btnTwo.hidden=YES;
                id image=imagesArr[0];
                if ([image isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageheader sd_setImageWithURL:[NSURL URLWithString:image]];
                }else if ([image isKindOfClass:[UIImage class]]){
                    //image
                    imageheader.image=image;
                }
                id image1=imagesArr[1];
                if ([image1 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageOne sd_setImageWithURL:[NSURL URLWithString:image1]];
                }else if ([image1 isKindOfClass:[UIImage class]]){
                    //image
                    imageOne.image=image1;
                }
                id image2=imagesArr[2];
                if ([image2 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imagetwo sd_setImageWithURL:[NSURL URLWithString:image2]];
                }else if ([image2 isKindOfClass:[UIImage class]]){
                    //image
                    imagetwo.image=image2;
                }
                
            }
                
                break;
            case 4:{
                
                _btnHeader.hidden=YES;
                _btnOne.hidden=YES;
                _btnTwo.hidden=YES;
                _btnThree.hidden=YES;
                id image=imagesArr[0];
                if ([image isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageheader sd_setImageWithURL:[NSURL URLWithString:image]];
                }else if ([image isKindOfClass:[UIImage class]]){
                    //image
                    imageheader.image=image;
                }
                id image1=imagesArr[1];
                if ([image1 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageOne sd_setImageWithURL:[NSURL URLWithString:image1]];
                }else if ([image1 isKindOfClass:[UIImage class]]){
                    //image
                    imageOne.image=image1;
                }
                id image2=imagesArr[2];
                if ([image2 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imagetwo sd_setImageWithURL:[NSURL URLWithString:image2]];
                }else if ([image2 isKindOfClass:[UIImage class]]){
                    //image
                    imagetwo.image=image2;
                }
                id image3=imagesArr[3];
                if ([image3 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageThree sd_setImageWithURL:[NSURL URLWithString:image3]];
                }else if ([image3 isKindOfClass:[UIImage class]]){
                    //image
                    imageThree.image=image3;
                }
            }
                
                break;
            case 5:{
                
                _btnHeader.hidden=YES;
                _btnOne.hidden=YES;
                _btnTwo.hidden=YES;
                _btnThree.hidden=YES;
                _btnfour.hidden=YES;
                id image=imagesArr[0];
                if ([image isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageheader sd_setImageWithURL:[NSURL URLWithString:image]];
                }else if ([image isKindOfClass:[UIImage class]]){
                    //image
                    imageheader.image=image;
                }
                id image1=imagesArr[1];
                if ([image1 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageOne sd_setImageWithURL:[NSURL URLWithString:image1]];
                }else if ([image1 isKindOfClass:[UIImage class]]){
                    //image
                    imageOne.image=image1;
                }
                id image2=imagesArr[2];
                if ([image2 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imagetwo sd_setImageWithURL:[NSURL URLWithString:image2]];
                }else if ([image2 isKindOfClass:[UIImage class]]){
                    //image
                    imagetwo.image=image2;
                }
                id image3=imagesArr[3];
                if ([image3 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageThree sd_setImageWithURL:[NSURL URLWithString:image3]];
                }else if ([image3 isKindOfClass:[UIImage class]]){
                    //image
                    imageThree.image=image3;
                }
                id image4=imagesArr[4];
                if ([image4 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageFour sd_setImageWithURL:[NSURL URLWithString:image4]];
                }else if ([image4 isKindOfClass:[UIImage class]]){
                    //image
                    imageFour.image=image4;
                }
                
            }
                
                break;
            case 6:{
                
                _btnHeader.hidden=YES;
                _btnOne.hidden=YES;
                _btnTwo.hidden=YES;
                _btnThree.hidden=YES;
                _btnfour.hidden=YES;
                _btnfive.hidden=YES;
                id image=imagesArr[0];
                if ([image isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageheader sd_setImageWithURL:[NSURL URLWithString:image]];
                }else if ([image isKindOfClass:[UIImage class]]){
                    //image
                    imageheader.image=image;
                }
                id image1=imagesArr[1];
                if ([image1 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageOne sd_setImageWithURL:[NSURL URLWithString:image1]];
                }else if ([image1 isKindOfClass:[UIImage class]]){
                    //image
                    imageOne.image=image1;
                }
                id image2=imagesArr[2];
                if ([image2 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imagetwo sd_setImageWithURL:[NSURL URLWithString:image2]];
                }else if ([image2 isKindOfClass:[UIImage class]]){
                    //image
                    imagetwo.image=image2;
                }
                id image3=imagesArr[3];
                if ([image3 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageThree sd_setImageWithURL:[NSURL URLWithString:image3]];
                }else if ([image3 isKindOfClass:[UIImage class]]){
                    //image
                    imageThree.image=image3;
                }
                id image4=imagesArr[4];
                if ([image4 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imageFour sd_setImageWithURL:[NSURL URLWithString:image4]];
                }else if ([image4 isKindOfClass:[UIImage class]]){
                    //image
                    imageFour.image=image4;
                }
                id image5=imagesArr[5];
                if ([image5 isKindOfClass:[NSString class]]) {
                    //url 加载图片
                    [imagefive sd_setImageWithURL:[NSURL URLWithString:image5]];
                }else if ([image5 isKindOfClass:[UIImage class]]){
                    //image
                    imagefive.image=image5;
                }
                
            }
                
                break;
                
            default:
                break;
        }
    }
    
    
}

@end
