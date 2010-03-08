package infrastructure
{
	import com.esri.ags.geometry.Geometry;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.geometry.Polygon;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;

	public class StadiumService_ESRI extends HTTPService implements IStadiumService
	{
		public function StadiumService_ESRI(rootURL:String=null, destination:String=null)
		{
			super(rootURL, destination);
		}
		
		public function getStadiumsForGeometry(geom:Geometry):AsyncToken{
			this.url=this.rootURL;
			var geomstring:String="{rings: [";
			var poly:Polygon = geom as Polygon;
			var firstRing:Boolean=true;
			for each (var ring:Object in poly.rings){
				if (!firstRing)
					geomstring=geomstring+",";
				geomstring=geomstring+"[";
				var firstPoint:Boolean = true;
				for each (var pt:MapPoint in ring){
					if (!firstPoint)
						geomstring=geomstring+",";
					geomstring=geomstring+"["+pt.x+","+pt.y+"]";
					firstPoint=false;
				}
				geomstring=geomstring+"]";
				firstRing=false;
			}
			geomstring=geomstring+"]}";
			return send({
				f:"json",
				geometry:geomstring,
				geometryType:" esriGeometryPolygon",
				spatialRel:"esriSpatialRelContains",
				outFields:"fid,team,conference"	
			});
		}
		
	}
}