//
//  ViewController.m
//  panImage
//
//  Created by jjw on 16/4/18.
//  Copyright © 2016年 jjw. All rights reserved.
//
#define SCREEN_Height   [UIScreen mainScreen].bounds.size.height
#define SCREEN_Width [UIScreen mainScreen].bounds.size.width
#import "ViewController.h"
#import "CGUserImageView.h"
#import "LCActionSheet.h"
@interface ViewController ()<LCActionSheetDelegate>
@property(strong,nonatomic)NSMutableArray*imagesUrlArr;
@end

@implementation ViewController
{
    // 开始拖动的view的下一个view的CGPoint（如果开始位置是0 结束位置是4 nextPoint值逐个往下算）
//    CGPoint nextPoint;
    
    // 用于赋值CGPoint
    CGPoint valuePoint;
    CGRect frameNew;//记录拖动时候的新载入的frame
     CGUserImageView*_headerImagesView;//图片展示区域
    NSInteger _selectedImageVIewTag;//所选的imageVIew当前的Tag；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _imagesUrlArr=[@[@"http://chenggua.com/imagesUrl/20151204/201512042214246086.png",[UIImage imageNamed:@"22.jpg"],[UIImage imageNamed:@"33.jpg"],@"http://chenggua.com/imagesUrl/20160401/201604011908592250.png",[UIImage imageNamed:@"秀场.png"],@"http://chenggua.com/imagesUrl/20160319/201603191828508459.png"] mutableCopy];
      _headerImagesView=[[CGUserImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Width)];
    [_headerImagesView resetSubImagesWithImageArr:_imagesUrlArr];
    [self.view addSubview:_headerImagesView];
    [self resetHeaderImageTap];//
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)resetHeaderImageTap
{
    
    for (UIImageView*img in _headerImagesView.subviews) {
        
        if ([img isKindOfClass:[UIImageView class]]) {
            //            JALog(@"_headerImagesVIew.subview--%@",img);
            img.userInteractionEnabled=NO;
            if (img.image!=nil&&![img.image isKindOfClass:[NSNull class]]&&img.image!=NULL) {
                img.userInteractionEnabled=YES;
                UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImageCLicked:)];
                [img addGestureRecognizer:tap];
                UILongPressGestureRecognizer*pressLong=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
                [img addGestureRecognizer:pressLong];
                UIPanGestureRecognizer*pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
                [img addGestureRecognizer:pan];
            }
        }
    }
}
-(void)ImageCLicked:(UITapGestureRecognizer*)tap
{
    UIImageView*imgView=(UIImageView*)tap.view;
    NSLog(@"imageclick--%ld--%@",tap.view.tag,imgView.image);
    
    if (_imagesUrlArr.count>1) {
        LCActionSheet *action=[[LCActionSheet alloc]initWithTitle:nil buttonTitles:@[@"删除图片"] redButtonIndex:-1 delegate:self];
        _selectedImageVIewTag=tap.view.tag;
        [action show];
    }
    
    
}
-(void)longPress:(UIGestureRecognizer*)ges
{
    NSLog(@"longPress---");
//    nextPoint=CGPointZero;
    valuePoint=CGPointZero;
    //    [infoTableview setContentOffset:CGPointMake(0, 0) animated:YES];
    CGRect BigRect=CGRectMake(0, 0, SCREEN_Width*2/3, SCREEN_Width*2/3);
    CGRect rect1=CGRectMake(SCREEN_Width*2/3, 0, SCREEN_Width/3, SCREEN_Width/3);
    CGRect rect2=CGRectMake(SCREEN_Width*2/3, SCREEN_Width/3, SCREEN_Width/3, SCREEN_Width/3);
    CGRect rect3=CGRectMake(SCREEN_Width*2/3, SCREEN_Width*2/3, SCREEN_Width/3, SCREEN_Width/3);
    CGRect rect4=CGRectMake(SCREEN_Width/3, SCREEN_Width*2/3, SCREEN_Width/3, SCREEN_Width/3);
    CGRect rect5=CGRectMake(0, SCREEN_Width*2/3, SCREEN_Width/3, SCREEN_Width/3);
    
    UIImageView*recogn=(UIImageView*)ges.view;
    CGRect oldframe;
    switch (ges.view.tag) {
        case 10:
            oldframe=BigRect;
            break;
        case 11:
            oldframe=rect1;
            break;
        case 12:
            oldframe=rect2;
            break;
        case 13:
            oldframe=rect3;
            break;
        case 14:
            oldframe=rect4;
            break;
        case 15:
            oldframe=rect5;
            break;
        default:
            break;
    }
    NSLog(@"oldframe--1---%@",NSStringFromCGRect(oldframe));
    
    for (UIImageView*btn in _headerImagesView.subviews) {
        if (btn!=recogn) {
            btn.userInteractionEnabled=NO;
        }
    }
    CGPoint recognizerPoint=[ges locationInView:_headerImagesView];
    //        recognizerPoint=recogn.center;
    
    UIImageView*nextImageView=nil;
    if (ges.state==UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.2 animations:^{
            if (recogn.tag==10) {
                recogn.transform=CGAffineTransformMakeScale(0.4, 0.4);
            }else{
                recogn.transform=CGAffineTransformMakeScale(0.8, 0.8);
            }
            recogn.alpha=0.7;
            
        }];
        valuePoint=recogn.center;
        
        [_headerImagesView bringSubviewToFront:recogn];
        
        //         NSLog(@"ValuePoint---%@",NSStringFromCGPoint(valuePoint));
    }else if (ges.state==UIGestureRecognizerStateChanged){
        recogn.center=recognizerPoint;
        recognizerPoint=recogn.center;
        if (CGRectContainsPoint(BigRect, recognizerPoint)) {
            
            nextImageView=_imagesUrlArr.count>0?[_headerImagesView viewWithTag:10]:nil;
            
        }else if (CGRectContainsPoint(rect1, recognizerPoint)){
            
            nextImageView=_imagesUrlArr.count>1?[_headerImagesView viewWithTag:11]:nil;
            
        }else if (CGRectContainsPoint(rect2, recognizerPoint)){
            
            nextImageView=_imagesUrlArr.count>2?[_headerImagesView viewWithTag:12]:nil;
            
            
        }else if (CGRectContainsPoint(rect3, recognizerPoint)){
            
            nextImageView=_imagesUrlArr.count>3?[_headerImagesView viewWithTag:13]:nil;
            
            
        }else if (CGRectContainsPoint(rect4, recognizerPoint)){
            
            nextImageView=_imagesUrlArr.count>4?[_headerImagesView viewWithTag:14]:nil;
            
            
        }else if (CGRectContainsPoint(rect5, recognizerPoint)){
            
            nextImageView=_imagesUrlArr.count>5?[_headerImagesView viewWithTag:15]:nil;
            
            
            
        }
        if (nextImageView) {
            //          nextPoint=nextImageView.center;
            frameNew=nextImageView.frame;
            NSLog(@"----newFrame-changed-❤️-%@",NSStringFromCGRect(frameNew));
        }
        
        //        nextImageView.center=valuePoint;
        //        if (!CGPointEqualToPoint(nextPoint, CGPointZero)) {
        //            valuePoint=nextPoint;
        //        }
        
        
    }else if (ges.state==UIGestureRecognizerStateEnded){
        for (UIImageView*btn in _headerImagesView.subviews) {
            if (btn!=recogn) {
                btn.userInteractionEnabled=YES;
            }
            
            
        }
        [UIView animateWithDuration:0.2 animations:^{
            if (recogn.tag==10) {
                if (CGRectContainsPoint(BigRect, valuePoint)) {
                    recogn.transform=CGAffineTransformMakeScale(1, 1);
                }else{
                    recogn.transform=CGAffineTransformMakeScale(0.5, 0.5);
                }
                
                
            }else{
                recogn.transform=CGAffineTransformMakeScale(1, 1);
            }
            recogn.alpha=1;
            //            recogn.center=valuePoint;
            
            
            
            //            [self reloadMyInfoImageView];
        }];
        
        NSInteger imgTag=0;
        NSLog(@"----newFrame-changeEnd-%@",NSStringFromCGRect(frameNew));
        if (!CGRectIsNull(frameNew)) {
            if (CGRectContainsRect(BigRect, frameNew)) {
                imgTag=CGRectContainsRect(BigRect, frameNew)?10:0;
            }else if (CGRectContainsRect(rect1, frameNew)){
                imgTag=CGRectContainsRect(rect1, frameNew)?11:0;
            }else if (CGRectContainsRect(rect2, frameNew)){
                imgTag=CGRectContainsRect(rect2, frameNew)?12:0;
            }else if (CGRectContainsRect(rect3, frameNew)){
                imgTag=CGRectContainsRect(rect3, frameNew)?13:0;
            }else if (CGRectContainsRect(rect4, frameNew)){
                imgTag=CGRectContainsRect(rect4, frameNew)?14:0;
            }else if (CGRectContainsRect(rect5, frameNew)){
                imgTag=CGRectContainsRect(rect5, frameNew)?15:0;
            }
        }
        
        
        
        if (imgTag>0) {
            if ([[_headerImagesView viewWithTag:imgTag] isKindOfClass:[UIImageView class]]) {
//                JALog(@"imgTag--%ld----endPoint--%@",imgTag,NSStringFromCGPoint(recognizerPoint));
                UIImageView*other=[_headerImagesView viewWithTag:imgTag];
//                JALog(@"nextimage-x-%.5f-width-%.5f---height--%.5f-imgTag--%ld----center-%@",other.frame.origin.x,other.frame.size.width,other.frame.size.height,imgTag,NSStringFromCGPoint(other.center));
                CGRect frameNewEnd=other.frame;
                if (CGSizeEqualToSize(frameNewEnd.size, BigRect.size)) {
                    frameNewEnd=BigRect;
                }
                
                
                
                other.frame=oldframe;
                recogn.frame=frameNewEnd;
                [_imagesUrlArr exchangeObjectAtIndex:recogn.tag-10 withObjectAtIndex:imgTag-10];
//                [_QiNiuImagesArr exchangeObjectAtIndex:recogn.tag-10 withObjectAtIndex:imgTag-10];
                other.tag=recogn.tag;
                recogn.tag=imgTag;
                //                JALog(@"arrChanges--%@",_imagesUrlArr);
                [_headerImagesView resetSubImagesWithImageArr:_imagesUrlArr];
                [self resetHeaderImageTap];
//                JALog(@"frame--new--%@",NSStringFromCGRect(frameNewEnd));
//                JALog(@"oldFrame--%@",NSStringFromCGRect(oldframe));
                
            }
            
            
        }else{
//            JALog(@"oldframe--%@----newFrame--%@",NSStringFromCGRect(oldframe),NSStringFromCGRect(frameNew));
            //            if (frameNew.origin.x>ScreenWidth||frameNew.origin.y>ScreenWidth||frameNew.origin.x<0||frameNew.origin.y<0) {
            //                frameNew=BigRect;
            //            }
            recogn.frame=oldframe;
            
            [self resetHeaderImageTap];
        }
        valuePoint=CGPointZero;

        frameNew=CGRectNull;
        
        
    }
}

- (void)actionSheet:(LCActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonindex--%ld",buttonIndex);
    if (buttonIndex==0) {
        [_imagesUrlArr removeObjectAtIndex:_selectedImageVIewTag-10];
        UIImageView*img=[_headerImagesView viewWithTag:_selectedImageVIewTag];
        img.image=nil;
        [_headerImagesView resetSubImagesWithImageArr:_imagesUrlArr];
        [self resetHeaderImageTap];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
