package presentation
{

	import application.SelectStadiumsSignal;
	import application.StadiumSelectedSignal;
	import application.StadiumsRecievedSignal;
	
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.Geometry;
	
	import domain.Stadium;
	import domain.Stadiums;
	
	import flash.events.EventDispatcher;


	public class MapViewPM extends EventDispatcher
	{
		
		[Bindable]
		public var selectedStadiums:Stadiums;
		
		[Inject]
		public var selectStadiumsSignal:SelectStadiumsSignal;
		
		[Inject]
		public var stadiumSelectedSignal:StadiumSelectedSignal;
		
		[Inject]
		public var stadiumsReceivedSignal:StadiumsRecievedSignal;
				
		
		[PostConstruct]
		public function mapSignalListeners():void
		{
			stadiumsReceivedSignal.add(stadiumsRecieved);
		}
		

		public function selectStadiums(geometry:Geometry):void{
			selectStadiumsSignal.dispatch(geometry);
		}
		
		public function stadiumSelected(graphic:Graphic):void{
			
			var stadium:Stadium = new Stadium(graphic.attributes.team,graphic.attributes.conference);
			stadium.geometry = graphic.geometry;
			stadiumSelectedSignal.dispatch(stadium);
		}
		
		public function stadiumsRecieved(stadiums:Stadiums):void{
			selectedStadiums = stadiums;
		}
				
		
	}
}