package domain
{
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class StadiumTest
	{
		[Test]
		public function canCreateAStadium():void{
			var stad:Stadium = new Stadium("Ruprict Boilermakers", "NFC");
			
			
			assertThat(stad.team,equalTo("Ruprict Boilermakers"));
			assertThat(stad.conference,equalTo("NFC"));
		}

	}
}