package domain
{
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	import org.flexunit.assertThat;
	import org.flexunit.experimental.eventfulTestCase.EventfulTestCase;
	import org.hamcrest.object.equalTo;
	
	public class StadiumsTest extends EventfulTestCase
	{
		private var _stadia:Stadiums;
		[Before]
		public function setUp():void{
			_stadia = new Stadiums();
		}
		
		[After]
		public function tearDown():void{
			
			_stadia=null;
		}
		[Test]
		public function shouldAddStadium():void{
			//Arrange
			var st:Stadium = new Stadium("Carolina Panthers","NVC");
			//Act
			_stadia.addStadium(st);
			//Assert
			assertThat(_stadia.items.length,equalTo(1));
		}
		
		[Test]
		public function shouldNotAddDuplicateStadium():void{
			//Arrange
			var ms1:Stadium = new Stadium("test");
			var ms2:Stadium = new Stadium("test");
			//Act
			_stadia.addStadium(ms1);
			_stadia.addStadium(ms1);
			
			//Assert
			assertThat(_stadia.items.length,equalTo(1));
		}
		
		[Test]
		public function shouldAddListOfSta():void{
			//Arrange
			var ms1:Stadium = new Stadium("test","conf");
			var ms2:Stadium = new Stadium("test2","conf");
			var list:ArrayCollection = new ArrayCollection();
			list.addItem(ms1);
			list.addItem(ms2);
			//Act
			_stadia.addStadiums(list);
			//Assert
			assertThat(_stadia.items.length,equalTo(2));
		}
		

	}
}