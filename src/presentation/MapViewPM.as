package presentation
{

	import application.SelectStadiumsEvent;
	
	import com.esri.ags.events.MapMouseEvent;
	import com.esri.ags.geometry.Geometry;
	
	import domain.Stadiums;
	
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;

	[Event(name="selectStadiums", type="application.SelectStadiumsEvent")]
    [ManagedEvents(names="selectStadiums")]
	public class MapViewPM extends EventDispatcher
	{
		
		[Inject]
		[Bindable]
		public var stadiums:Stadiums;
				
		public function MapViewPM():void{
			super();
		}
		
		
		public function selectStadiums(geometry:Geometry):void{
			dispatchEvent(new SelectStadiumsEvent(geometry));
		}
		
		public function doMapClick(event:MapMouseEvent):void{
			Alert.show(event.mapPoint.x.toString());
		}
		
				
		
	}
}