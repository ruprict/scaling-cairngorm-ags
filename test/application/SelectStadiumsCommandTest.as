package application
{
	import asmock.framework.Expect;
	import asmock.framework.MockRepository;
	
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.Polygon;
	
	import domain.Stadiums;
	
	import infrastructure.IStadiumService;
	
	import mx.rpc.AsyncToken;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
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
			Expect.call(serv.getStadiumsForGeometry(poly)).returnValue(new AsyncToken());
			comm.service = serv;
			mockery.replay(serv);
			//Act
			comm.execute(new SelectStadiumsEvent(poly));
			//Assert
			mockery.verify(serv);
		}
		
		[Test]
		public function shouldSetStadiumsOnModel():void{
			//Arrange
			var comm:SelectStadiumsCommand = new SelectStadiumsCommand();
			var stadiums:Stadiums = new Stadiums();
			comm.selectedStadiums=stadiums;
			var result:String=  '{"displayFieldName" : "conference","fieldAliases" : {"conference" : "conference","FID" : "FID","team" : "team"}, "geometryType" : "esriGeometryPoint",  "spatialReference" : {   "wkid" : 4326  },  "features" : [ { "attributes" : { "conference" : "NFC",  "FID" : 0, "team" : "Bears" }, "geometry" : { "x" : -87.6166719999999, "y" : 41.862306 }},{ "attributes" : { "conference" : "AFC",  "FID" : 1, "team" : "Bengals" }, "geometry" : { "x" : -84.516039, "y" : 39.095442 }}]}';
						
			//Act
			comm.handleStadiums(result,new SelectStadiumsEvent(new Extent()));
			//Assert
			assertThat(comm.selectedStadiums.items.length,equalTo(2));
		}

	}
}