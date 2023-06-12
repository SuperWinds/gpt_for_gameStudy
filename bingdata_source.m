-(void)Update__youfunction__InfoTabel:(NSDictionary*)info_data
{
   //绑定文字显示
    PALabel *attactLabel = [__youfunction__MV getChildByName:@"artifact_attack"];
    attactLabel.string = [[info_data objectForKey:@"attack"] stringValue];

    //绑定按钮并设置回调
    PAMovieClip *buy_btn = [__youfunction__MV getChildByName:@"buy_btn"];
    [buy_btn attachEventListener:ON_CLICK withTarget:self andSelector:@"buyPetEgg:withParams:" andParams:[NSString stringWithFormat:@"%@",eggid]];
    
    //绑定图片显示
    PASprite* aritfact_bg_Img = [self loadFlashArtifactSprite:[artifact_info_data objectForKey:@"image"] withSize:CGPointMake(100, 100)];
    [[self.mV getChildByName:@"artifact_img"] removeAllChildren];
    [[self.mV getChildByName:@"artifact_img"] addChild:aritfact_bg_Img withName:@"back_ground"  z:self.dynamicContentZLayer];
}
