package infrastructure
{
	import com.esri.ags.geometry.Geometry;
	
	import mx.rpc.AsyncToken;
	
	public interface IStadiumService
	{
		function getStadiumsForGeometry(geometry:Geometry):AsyncToken;
		
	}
}