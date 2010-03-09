package presentation
{

	import application.SelectStadiumsEvent;
	import application.StadiumSelectedEvent;
	
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.Geometry;
	
	import domain.Stadium;
	import domain.Stadiums;
	
	import flash.events.EventDispatcher;

	[Event(name="selectStadiums", type="application.SelectStadiumsEvent")]
	[Event(name="stadiumSelected", type="application.StadiumSelectedEvent")]
    [ManagedEvents(names="selectStadiums,stadiumSelected")]
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
		
		public function stadiumSelected(graphic:Graphic):void{
			
			var stadium:Stadium = new Stadium(graphic.attributes.team,graphic.attributes.conference);
			stadium.geometry = graphic.geometry;
			dispatchEvent(new StadiumSelectedEvent(stadium));
		}
				
		
	}
}