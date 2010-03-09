package application
{
	import com.esri.ags.geometry.MapPoint;
	
	import domain.Stadium;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class StadiumSelectedCommandTest
	{
		
		[Test]
		public function shouldSetSelectedStadiumOnModel():void{
			//Arrange
			var comm:StadiumSelectedCommand= new StadiumSelectedCommand();
			
			var stadium:Stadium = new Stadium("Cowboys","NFC");
			 
			var mp:MapPoint = new MapPoint(1,2);
			stadium.geometry =mp;
			//Act
			comm.execute(new StadiumSelectedEvent(stadium));
			//Assert
			assertThat(comm.selectedExtent.xmin,equalTo(mp.x-1));
		}

	}
}