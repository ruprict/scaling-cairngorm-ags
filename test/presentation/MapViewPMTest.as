package presentation
{

	import com.esri.ags.geometry.Extent;
	
	import org.flexunit.experimental.eventfulTestCase.EventfulTestCase;
	
	public class MapViewPMTest extends EventfulTestCase
	{
		
		[Test]
		public function shouldDispatchSelectStadiumsEvent():void{
			//Arrange
			var pm:MapViewPM = new MapViewPM();
			var extent:Extent = new Extent(1,2,3,4);
			listenForEvent(pm,"selectStadiums",true);
			
			//Act
			pm.selectStadiums(extent);
			
			//Assert
			assertEvents();			
			
		}

	}
}