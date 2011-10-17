package eu.riasol.algoritm.astar
{
	public class Node
	{
		public var x:uint
		public var y:uint
		private var _f:Number
		/**
		 * Cost from start
		 */ 
		public var g:Number
		public var costMultiplier:Number=1
		/**
		 * Estimated cost to end
		 */ 
		public var h:Number	
		public var walkable:Boolean=true
			public var parent:Node
		public function Node(x:int,y:int)
		{
			this.x=x
			this.y=y
		}

		/**
		 * Total cost
		 */
		public function get f():Number
		{
			_f=g+h//TODO simplify
			return _f;
		}

		/**
		 * @private
		 */
		public function set f(value:Number):void
		{
			_f = value;
		}

	}
}