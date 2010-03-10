package domain
{
	import com.esri.ags.Graphic;
	[Bindable]
	public class Stadium extends Graphic
	{
		
		
		
		public function Stadium(team:String,conference:String="NFC"){
			this.attributes={};
			this.attributes.conference=conference;
			this.attributes.team=team;	
			
		}
		
		public function set team(t:String):void{
			this.attributes.team=t;
		}
		public function get team():String{
			return this.attributes.team;
		}
		
		public function get conference():String{
			return this.attributes.conference;
		}
		
	}
}