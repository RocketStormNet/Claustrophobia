package  
{
    import com.newgrounds.*;
    import com.newgrounds.components.*;
    import flash.display.MovieClip;
	import org.flixel.*;


    public class Preloader extends MovieClip
    {
        public function Preloader() 
        {
            var apiConnector:APIConnector = new APIConnector();
            apiConnector.className = "Main";
            apiConnector.apiId = "23344:bKSQUqkN";
            apiConnector.encryptionKey = "oZVp95KM5m8u1FMUlvJr8AqYWVuo7Iug";
            addChild(apiConnector);


            // center connector on screen
            if(stage)
            {
                apiConnector.x = (stage.stageWidth - apiConnector.width) / 2;
                apiConnector.y = (stage.stageHeight - apiConnector.height) / 2;
            }
        }    
    }
}