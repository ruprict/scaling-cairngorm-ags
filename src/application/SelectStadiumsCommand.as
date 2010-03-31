package application
{
		
	import com.adobe.serialization.json.JSON;
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.Geometry;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.geometry.Polygon;
	
	import domain.Stadiums;
	
	import infrastructure.IStadiumService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class SelectStadiumsCommand extends SignalCommand
	{
		
		[Inject]
		public var service:IStadiumService;
		
		[Inject]
		public var geometry:Polygon;
		
		[Inject]
		public var signal:SelectStadiumsSignal;
		
		[Inject]
		public var stadiumsRecievedSignal:StadiumsRecievedSignal;
		
		override public function execute():void{
			var responder:IResponder = new Responder(handleStadiums, handleFault);
			var token:AsyncToken;
			
			token = service.getStadiumsForGeometry(geometry);
			token.addResponder(responder);
		}
		
		public function handleStadiums(result:ResultEvent):void{
			//Transform result
			trace(result.result);
			var res:Object = JSON.decode(result.result as String);
			var graphics:Array = [];
			for each (var feat:Object in res.features){
				var graph:Graphic = new Graphic();
				graph.attributes = feat.attributes;
				graph.geometry = new MapPoint(feat.geometry.x,feat.geometry.y);
				graphics.push(graph);
			}
			var stadiums:Stadiums = new Stadiums();
			stadiums.addStadiums(new ArrayCollection(graphics));
			stadiumsRecievedSignal.dispatch(stadiums);

		}
		
		public function handleFault(fault:Fault,event:SelectStadiumsSignal):void{
			Alert.show(fault.toString());
		}
		
	}
}