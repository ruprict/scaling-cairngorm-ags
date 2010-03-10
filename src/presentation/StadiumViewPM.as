package presentation
{
	import com.esri.ags.geometry.Extent;
	
	import domain.Stadium;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class StadiumViewPM extends EventDispatcher
	{
		
		[Inject]
		[Bindable]
		public var selectedExtent:Extent;
		
		[Inject(id="selectedStadium")]
		[Bindable]
		public var selectedStadium:Stadium;
		
		[Inject]
		[Bindable]
		public var popUpHandler:PopUpPresenter;
		
		
		public function StadiumViewPM(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
	}
}