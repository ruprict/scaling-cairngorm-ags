package domain
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;

	[Event(name="itemsChange", type="flash.events.Event")]
	
	public class Stadiums extends EventDispatcher
	{
		private var _items:ArrayCollection = new ArrayCollection();
		[Bindable("itemsChange")]
		public function get items():ArrayCollection{
			return _items;
		}
		
		
		
		public function addStadium(item:Stadium):void{
			if (_items.toArray().indexOf(item)>-1)
				return;
			
			_items.addItem(item);
			dispatchEvent(new Event("itemsChange"));
			
		}
		
		public function addStadiums(items:ArrayCollection):void{
			
			_items=items;
			dispatchEvent(new Event("itemsChange"));
		}
		
	}
}