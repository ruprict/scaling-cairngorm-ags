package domain
{
	import com.esri.ags.Graphic;
	
	public class Stadium extends Graphic
	{
		
		
		//This is a value object....so it's immutable
		public function Stadium(team:String,conference:String="NFC"){
			this.attributes={};
			this.attributes.conference=conference;
			this.attributes.team=team;	
		}
		
		public function get team():String{
			return this.attributes.team;
		}
		
		public function get conference():String{
			return this.attributes.conference;
		}
		
	}
}