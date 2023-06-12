-(void)Update__youfunction__InfoTabel:(NSDictionary*)info_data
{
   //绑定文字显示
    PALabel *attactLabel = [artifactContent getChildByName:@"artifact_attack"];
    attactLabel.string = [[info_data objectForKey:@"attack"] stringValue];
   //绑定图片显示
   

}
