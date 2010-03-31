package application
{
	
	import com.esri.ags.geometry.Extent;
	
	import domain.*;
	
	import infrastructure.*;
	
	import org.robotlegs.mvcs.SignalContext;
	
	import presentation.*;
	
	public class ScalingContext extends SignalContext
	{
		private const VIEW_PACKAGE:String = "presentation";
		
				
		override public function startup():void
		{
			//map the views
			viewMap.mapPackage(VIEW_PACKAGE);
			
			//map the domain
			injector.mapSingleton(Stadiums);
						
			//map the presentation models
			injector.mapSingleton( MapViewPM);
			injector.mapSingleton( StadiumViewPM);
			injector.mapSingleton( PopUpPresenter);
			
			var serv:IStadiumService = new StadiumService_ESRI("http://esi-ggoodrich.esi.com/arcgis/rest/services/nfl/MapServer/0/query");
			//map the services and their factories
			injector.mapValue(IStadiumService, serv );
			
						
			//map the signals
			signalCommandMap.mapSignalClass(StadiumSelectedSignal,StadiumSelectedCommand);
			signalCommandMap.mapSignalClass(SelectStadiumsSignal,SelectStadiumsCommand);
			injector.mapSingleton(StadiumsRecievedSignal);
			
			
		}
	}
}