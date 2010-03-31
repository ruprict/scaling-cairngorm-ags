package presentation
{

	import application.SelectStadiumsSignal;
	import application.StadiumSelectedSignal;
	
	import asunit.asserts.assertTrue;
	
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.Extent;
	
	import domain.Stadium;
	
	import org.flexunit.experimental.eventfulTestCase.EventfulTestCase;
	
	public class MapViewPMTest
	{		
		[Test]
		public function shouldDispatchSelectStadiumsEvent():void{
			//Arrange
			var pm:MapViewPM = new MapViewPM();
			var signal:SelectStadiumsSignal = new SelectStadiumsSignal();
			var called:Boolean=false;
			signal.add(function(ext:Extent):void{called=true;});
			
			pm.selectStadiumsSignal=signal;
			var extent:Extent = new Extent(1,2,3,4);
			
			//Act
			pm.selectStadiums(extent);
			//Assert
			assertTrue(called);
		}
		
		[Test]
		public function shouldDispatchStadiumSelectedEvent():void{
			//Arrange
			var pm:MapViewPM = new MapViewPM();
			var signal:StadiumSelectedSignal = new StadiumSelectedSignal();
			pm.stadiumSelectedSignal=signal;
			var called:Boolean=false;
			signal.add(function(stad:Stadium):void{called=true;});
			var graphic:Graphic = new Graphic(null,null,{team:"Cowboys",conference:"NFC"});
						
			//Act
			pm.stadiumSelected(graphic);
			
			//Assert
			assertTrue(called);
			
		}

	}
}