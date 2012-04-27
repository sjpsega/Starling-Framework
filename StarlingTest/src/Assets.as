package
{
    import flash.display.Bitmap;
    import flash.utils.Dictionary;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
    
    /**
     * ...
     * @author jianping.shenjp
     */
    public class Assets
    {
        [Embed(source="../assets/graphics/bgWelcome.jpg")]
        static public const BgWelcome:Class;
        
        [Embed(source="../assets/graphics/welcome_hero.png")]
        static public const WelcomeHero:Class;
        
        [Embed(source="../assets/graphics/welcome_title.png")]
        static public const WelcomeTitle:Class;
        
        [Embed(source="../assets/graphics/welcome_playButton.png")]
        static public const WelcomePlayBtn:Class;
        
        [Embed(source="../assets/graphics/welcome_aboutButton.png")]
        static public const WelcomeAboutBtn:Class;
        
        static private var gameTextures:Dictionary = new Dictionary();
        
        static private var gameTextureAtlas:TextureAtlas;
        
        [Embed(source="../assets/graphics/mySpritesheet.png")]
        static public const AtlasTextureGame:Class;
        
        [Embed(source="../assets/graphics/mySpritesheet.xml",mimeType="application/octet-stream")]
        static public const AtlasXmlGame:Class;
        
        static public function getAtlas():TextureAtlas
        {
            if (gameTextureAtlas == null)
            {
                var texture:Texture = getTexture("AtlasTextureGame");
                var xml:XML = new XML(new AtlasXmlGame);
                gameTextureAtlas = new TextureAtlas(texture,xml);
            }
            return gameTextureAtlas;
        }
        
        static public function getTexture(name:String):Texture
        {
            if (gameTextures[name] == undefined)
            {
                var bitmap:Bitmap = new Assets[name]();
                gameTextures[name] = Texture.fromBitmap(bitmap);
            }
            return gameTextures[name];
        }
    }

}