package application
{
		
	import com.adobe.serialization.json.JSON;
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.MapPoint;
	
	import domain.Stadiums;
	
	import infrastructure.IStadiumService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	public class SelectStadiumsCommand
	{
		
		[Inject]
		public var service:IStadiumService;
		
		[Inject]
		public var selectedStadiums:Stadiums;
		
		[Command(selector="selectStadiums")]
		public function execute(event:SelectStadiumsEvent):AsyncToken{
			
			return service.getStadiumsForGeometry(event.geometry);
		}
		
		[CommandResult(selector="selectStadiums")]
		public function handleStadiums(result:*,event:SelectStadiumsEvent):void{
			//Transform result
			trace(result);
			var res:Object = JSON.decode(result);
			var graphics:Array = [];
			for each (var feat:Object in res.features){
				var graph:Graphic = new Graphic();
				graph.attributes = feat.attributes;
				graph.geometry = new MapPoint(feat.geometry.x,feat.geometry.y);
				graphics.push(graph);
			}
			selectedStadiums.items.removeAll();
			selectedStadiums.addStadiums(new ArrayCollection(graphics));

		}
		
		[CommandFault(selector="selectStadiums")]
		public function handleFault(fault:Fault,event:SelectStadiumsEvent):void{
			Alert.show(fault.toString());

		}
		
	}
}