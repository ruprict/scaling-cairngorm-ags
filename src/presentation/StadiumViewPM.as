package presentation
{
	import com.esri.ags.geometry.Extent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class StadiumViewPM extends EventDispatcher
	{
		
		[Inject]
		[Bindable]
		public var selectedExtent:Extent;
		
		public function StadiumViewPM(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
	}
}