package eu.riasol.algoritm.astar
{
	public class Grid
	{
		private var _startNode:Node
		private var _endNode:Node
		private var nodes:Vector.<Node> 
		private var _numCols:uint
		private var _numRows:uint
		public function Grid(_numCols:uint,_numRows:uint)
		{
			this._numCols=_numCols
			this._numRows=_numRows
				nodes= new Vector.<Node>(_numCols*_numRows,true);
				for (var x:int = 0; x < _numCols; x++) 
				{
					for (var y:int = 0; y < _numRows; y++) 
					{
						nodes[x+y*_numCols]=new Node(x,y)
					}
					
				}
				
		}
		public function getNode(x:uint,y:uint):Node{
			return nodes[x+y*_numCols]
		}
		public function setEndNode(x:uint,y:uint):void{
			var idx:uint=x+y*_numCols
			_endNode=nodes[idx]
		}
		public function get endNode():Node{
			return _endNode
		}
		public function setStartNode(x:uint,y:uint):void{
			_startNode=nodes[x+y*_numCols]
		}
		public function get startNode():Node{
			return _startNode
		}
		public function setWalkable(x:uint,y:uint,walkable:Boolean):void{
			nodes[x+y*_numCols].walkable=walkable
		}
		public function get numCols():uint{
			return _numCols
		}
		public function get numRows():uint{
			return _numRows
		}
	}
}