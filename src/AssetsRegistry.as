package src
{
	/**
	 * Assets Registry
	 * 
	 * These sprites and tiles are NOT for use in your own games.
	 * By all means use them for testing and prototypes, but do not use them in commecial games,
	 * games seeking sponsorship or games carrying adverts (like Mochi Ads)
	 * 
	 * Because lots of the Tests use the same assets we store them in here.
	 * 
	 * If we stored them in their respective Test classes then they will be compiled multiple times
	 * into the SWF! The Flex compiler isn't clever enough to tell you're using the same asset across
	 * classes, so you end up wasting a lot of space.
	 */
	public class AssetsRegistry 
	{
		
		
		[Embed(source = '/src/bullet.png')] public static var chunkPNG:Class;
		
		public function AssetsRegistry() 
		{
		}
		
	}

}