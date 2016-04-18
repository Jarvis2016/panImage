# panImage
imageview上面加长按及滑动手势来重置imageView的位置
view里面的resetimage方法重置imageview的tag值
resetHeaderImageTap方法来重置image的手势

  _imagesUrlArr=[@[@"http://chenggua.com/imagesUrl/20151204/201512042214246086.png",[UIImage imageNamed:@"22.jpg"],[UIImage imageNamed:@"33.jpg"],@"http://chenggua.com/imagesUrl/20160401/201604011908592250.png",[UIImage imageNamed:@"秀场.png"],@"http://chenggua.com/imagesUrl/20160319/201603191828508459.png"] mutableCopy];
      _headerImagesView=[[CGUserImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Width)];
    [_headerImagesView resetSubImagesWithImageArr:_imagesUrlArr];
    [self.view addSubview:_headerImagesView];
    [self resetHeaderImageTap];
