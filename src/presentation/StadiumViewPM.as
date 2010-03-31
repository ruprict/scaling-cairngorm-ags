package presentation
{
	import application.StadiumSelectedSignal;
	
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;
	
	import domain.Stadium;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class StadiumViewPM extends EventDispatcher
	{
		
		
		[Bindable]
		public var selectedExtent:Extent;
		
		[Bindable]
		public var selectedStadium:Stadium;
		
		[Inject]
		public var stadiumSelectedSignal:StadiumSelectedSignal;
		
		[Bindable]
		[Inject]
		public var popUpHandler:PopUpPresenter;
		
		
		[PostConstruct]
		public function mapListeners():void{
			stadiumSelectedSignal.add(stadiumSelected);
		}
				
		public function StadiumViewPM(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stadiumSelected(stadium:Stadium):void{
			selectedStadium = stadium;
			selectedExtent = new Extent(0,0,0,0).centerAt(selectedStadium.geometry as MapPoint);
			
		}
		
		
	}
}