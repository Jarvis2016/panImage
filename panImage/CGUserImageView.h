//
//  CGUserImageView.h
//  panImage
//
//  Created by jjw on 16/4/18.
//  Copyright © 2016年 jjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGUserImageView : UIView
-(id)initWithFrame:(CGRect)frame;
@property(nonatomic,strong)UIImageView*headerImageV;//头像
@property(nonatomic,strong)UIImageView*OneImageV;//右第一张；
@property(nonatomic,strong)UIImageView*TwoImageV;//右第二张；
@property(nonatomic,strong)UIImageView*ThreeImageV;//右第三张；
@property(nonatomic,strong)UIImageView*fourImageV;//底部中间一张图片；
@property(nonatomic,strong)UIImageView*fiveImageV;//底部左起第一张；
@property(nonatomic,strong)UIButton*btnHeader;
@property(nonatomic,strong)UIButton*btnOne;
@property(nonatomic,strong)UIButton*btnTwo;
@property(nonatomic,strong)UIButton*btnThree;
@property(nonatomic,strong)UIButton*btnfour;
@property(nonatomic,strong)UIButton*btnfive;
-(void)resetSubImagesWithImageArr:(NSArray*)imagesArr;
@end
