package esi.dbc
{
	public final class Check
	{
		
		public static function Require(assertion:Boolean, message:String="Precondition failed"):void{
			if (!assertion) throw new PreconditionError(message);
			
		}
	
		
		public static function Ensure(assertion:Boolean,message:String="Postcondition failed"):void{
			if (!assertion) throw new PostconditionError(message);
		}


	}
	
	
}