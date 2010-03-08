package esi.dbc
{
	public class PreconditionError extends Error
	{
		public function PreconditionError(message:String="", id:int=0)
		{
			super(message, id);
		}
		
	}
}