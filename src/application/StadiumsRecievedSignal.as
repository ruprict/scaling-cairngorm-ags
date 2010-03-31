package application
{
	import domain.Stadiums;
	
	import org.osflash.signals.Signal;
	
	public class StadiumsRecievedSignal extends Signal
	{
		public function StadiumsRecievedSignal()
		{
			super(Stadiums);
		}
	}
}