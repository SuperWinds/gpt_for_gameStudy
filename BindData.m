-(void) configureView
{
    //初始化主面板
    self.list_anchor = [self.mV getChildByName:@"pet_item_anchor"];
    [self.list_anchor removeAllChildren];

    //获取后端数据
    self.eggDatas = [self.dataDictionary objectForKey:@"pet_eggs"];

    //设置图片格式
    NSDictionary* bfParams = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:315], [NSNumber numberWithInt:207], nil] forKeys:[NSArray arrayWithObjects:@"width", @"height", nil]];
    self.iconParam = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:115], [NSNumber numberWithInt:115], nil] forKeys:[NSArray arrayWithObjects:@"width", @"height", nil]];
   
    //绑定文字Label
    PALabel *rule_txt = [self.mV getChildByName:@"info_txt"];
    rule_txt.string =  [self.dataDictionary objectForKey:@"rule_string"];
    
 
    //绑定Button并讲点击Button的回调函数设置为buyPetEgg
    PAMovieClip *buy_btn = [petClip getChildByName:@"buy_btn"];
    
    [buy_btn attachEventListener:ON_CLICK withTarget:self andSelector:@"buyPetEgg:withParams:" andParams:[NSString stringWithFormat:@"%@",eggid]];
   
    //添加主界面Level按钮
    [[botNavBar getChildByName:@"btn_01"] attachEventListener:ON_CLICK withTarget:self andSelector:@"leaveBtnClicked:withParams:" andParams:nil];

    NSMutableDictionary *persistentBottomNavDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                    botNavBar, @"customBottomNav", @"bot_nav_bar_boss_join", @"navName", nil];

    [CANotificationCenter postNotification:kCustomPersistentBottomNavNotification withParams:persistentBottomNavDict];
    
    //设置界面标题
    NSDictionary *pageNameDict = [NSDictionary dictionaryWithObjectsAndKeys:@"ORACLE PET EGGS", @"name", nil];
    [CANotificationCenter postNotification:kHeaderViewPageNameNotification withParams:pageNameDict];

    //设置刷新机制
    [self.mV updateScrollPaneContentSize:TRUE];
    [self.mV forceScrollContentSize:CGSizeMake(320.f, weight+218.f) andGotoOrigin:TRUE];
}
