package application
{
	import domain.Stadium;
	
	import flash.events.Event;

	public class StadiumSelectedEvent extends Event
	{
		public static const STADIUM_SELECTED:String = "stadiumSelected";
		public var stadium:Stadium;
		public function StadiumSelectedEvent(stadium:Stadium)
		{
			super(STADIUM_SELECTED);
			this.stadium=stadium;
			
		}
		
		override public function clone():Event{
			return new StadiumSelectedEvent(stadium);
		}
		
	}
}