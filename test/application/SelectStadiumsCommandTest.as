package application
{
	import asmock.framework.Expect;
	import asmock.framework.MockRepository;
	
	import asunit.asserts.assertTrue;
	
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.Polygon;
	
	import domain.Stadium;
	import domain.Stadiums;
	
	import infrastructure.IStadiumService;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.object.equalTo;
	import org.osflash.signals.utils.SignalAsync;
	import org.osflash.signals.utils.SignalAsyncEvent;
	
	[RunWith("asmock.integration.flexunit.ASMockClassRunner")]
	[Mock("infrastructure.IStadiumService")]
	public class SelectStadiumsCommandTest
	{
		[Test]
		public function shouldCallService():void{
			//Arrange
			var mockery:MockRepository = new MockRepository();
			var comm:SelectStadiumsCommand = new SelectStadiumsCommand();
			var serv:IStadiumService = IStadiumService(mockery.createStrict(IStadiumService));
			var poly:Polygon = new Polygon();
			comm.geometry=poly;
			Expect.call(serv.getStadiumsForGeometry(poly)).returnValue(new AsyncToken());
			comm.service = serv;
			mockery.replay(serv);
			//Act
			comm.execute();
			//Assert
			mockery.verify(serv);
		}
		
		[Test]
		public function shouldRaiseStadiumsRecievedSignal():void{
			//Arrange
			var comm:SelectStadiumsCommand = new SelectStadiumsCommand();
			comm.stadiumsRecievedSignal = new StadiumsRecievedSignal();
			var called:Boolean = false;
			var stadiums:Stadiums = new Stadiums();
			comm.stadiumsRecievedSignal.add(function(stad:Stadiums):void{stadiums=stad;called=true;});
			var result:String=  '{"displayFieldName" : "conference","fieldAliases" : {"conference" : "conference","FID" : "FID","team" : "team"}, "geometryType" : "esriGeometryPoint",  "spatialReference" : {   "wkid" : 4326  },  "features" : [ { "attributes" : { "conference" : "NFC",  "FID" : 0, "team" : "Bears" }, "geometry" : { "x" : -87.6166719999999, "y" : 41.862306 }},{ "attributes" : { "conference" : "AFC",  "FID" : 1, "team" : "Bengals" }, "geometry" : { "x" : -84.516039, "y" : 39.095442 }}]}';
			var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,result);
			
			//var instance:SignalAsync =new SignalAsync(comm.stadiumsRecievedSignal); 
			//Act
			//Async.proceedOnEvent(this,instance,SignalAsyncEvent.CALLED,500, handleStadiumsRecieved);
			comm.handleStadiums(event);
			//Assert
			assertThat(called);
			assertThat(stadiums.items.length, equalTo(2));
		}
		
		private function handleStadiumsRecieved(event:SignalAsyncEvent,...rest):void{
			assertThat(event.args[0].items.length,equalTo(2));
		}
	}
}