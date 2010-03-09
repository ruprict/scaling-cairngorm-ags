package application
{
		
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;
	
	public class StadiumSelectedCommand
	{
		[Inject]
		[Bindable]
		public var selectedExtent:Extent;
		
		[Command(selector="stadiumSelected")]
		public function execute(event:StadiumSelectedEvent):void{
			var newExtent:Extent =this.selectedExtent.centerAt(event.stadium.geometry as MapPoint);
			selectedExtent.xmax=newExtent.xmax;
			
			selectedExtent.ymax=newExtent.ymax;
			selectedExtent.ymin=newExtent.ymin;
			selectedExtent.xmin=newExtent.xmin;
		
		}
		
		
		
	}
}