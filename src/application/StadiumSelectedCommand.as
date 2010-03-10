package application
{
		
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;
	
	import domain.Stadium;
	
	import presentation.PopUpPresenter;
	
	public class StadiumSelectedCommand
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
		
		[Command(selector="stadiumSelected")]
		public function execute(event:StadiumSelectedEvent):void{
			popUpHandler.showStadium=true;
			selectedStadium.team=event.stadium.team;
			var newExtent:Extent =this.selectedExtent.centerAt(event.stadium.geometry as MapPoint);
			selectedExtent.xmax=newExtent.xmax;
			
			selectedExtent.ymax=newExtent.ymax;
			selectedExtent.ymin=newExtent.ymin;
			selectedExtent.xmin=newExtent.xmin;
		}
		
		
		
	}
}