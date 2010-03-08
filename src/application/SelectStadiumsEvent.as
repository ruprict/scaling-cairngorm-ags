package application
{
	import com.esri.ags.geometry.Geometry;
	
	import flash.events.Event;

	public class SelectStadiumsEvent extends Event
	{
		public static const SELECT_STADIUMS:String = "selectStadiums";
		public var geometry:Geometry;
		public function SelectStadiumsEvent(geom:Geometry)
		{
			super(SELECT_STADIUMS);
			this.geometry=geom;
			
		}
		
		override public function clone():Event{
			return new SelectStadiumsEvent(geometry);
		}
		
	}
}