package esi.dbc
{
	public class PostconditionError extends Error
	{
		public function PostconditionError(message:String="", id:int=0)
		{
			super(message, id);
		}
		
	}
}