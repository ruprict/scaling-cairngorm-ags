package application
{
		
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;
	
	import domain.Stadium;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	import presentation.PopUpPresenter;
	
	public class StadiumSelectedCommand extends SignalCommand
	{
		
		[Inject]
		public var popUpHandler:PopUpPresenter;
						
		override public function execute():void{
			popUpHandler.showStadium=true;						
		}
		
		
		
	}
}