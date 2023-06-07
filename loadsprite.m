
-(PASprite*) loadFlash__FunctionName__Sprite:(NSString*)imageName withSize:(CGPoint)size{
    return [self loadFlashA__FunctionName__Sprite:imageName withPath:CA_IPHONE_GRAPHICS_URL withSize:size];
}

-(PASprite*) loadFlash__FunctionName__Sprite:(NSString*)imageName withPath:(NSString*)path withSize:(CGPoint)size{
    
    NSURL* URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",path, imageName]];
    NSDictionary* imageParams = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithFloat:size.x], [NSNumber numberWithFloat:size.y], nil] forKeys:[NSArray arrayWithObjects:@"width", @"height", nil]];
    
    PASprite* sprite = [PASprite spriteWithURL:URL andParameters:imageParams];
    sprite.position = CGPointMake(0, -size.y);
    
    return sprite;
}
