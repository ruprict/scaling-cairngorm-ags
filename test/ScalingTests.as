package 
{
	import application.GetStadiumsCommandTest;
	import application.StadiumSelectedCommandTest;
	
	import domain.StadiumTest;
	import domain.StadiumsTest;
	
	import presentation.MapViewPMTest;
	
	
    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class ScalingTests
    {
		public var mapViewPMTest:MapViewPMTest;
		public var stadiumTest:StadiumTest;
		public var stadiumsTest:StadiumsTest;
		public var getStadiumsCommandTest:GetStadiumsCommandTest;
		public var selectedStadium:StadiumSelectedCommandTest;
		
    }
}