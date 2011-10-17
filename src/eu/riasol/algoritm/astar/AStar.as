package eu.riasol.algoritm.astar
{
	public class AStar
	{
		/**
		 * nodes visited with assigned cost
		 */ 
		private var open:Vector.<Node>
		/**
		 * Nodes with all neighbors visited
		 */ 
		private var closed:Vector.<Node>
		public var path:Vector.<Node>
		private var grid:Grid
		private var endNode:Node
		private var startNode:Node
		private var straightCost:Number=1.0
		private var diagCost:Number=Math.SQRT2
		private var _heuristicType:uint;
		public static const HEURISTIC_MANHATAN:uint=1
		public static const HEURISTIC_EUCLIDIAN:uint=2
		public static const HEURISTIC_DIAGONAL:uint=3
		public function AStar()
		{
			heuristicType=HEURISTIC_MANHATAN
		}

		public function set heuristicType(value:uint):void
		{
			_heuristicType = value;
		}

		public function findPath(grid:Grid):Boolean{
			this.grid=grid
			open=new Vector.<Node>()
			closed=new Vector.<Node>()
			startNode=grid.startNode
			endNode=grid.endNode
			startNode.g=0
			startNode.h=heuristic(startNode)
			return search()
		}
		public function search():Boolean{
			var node:Node=startNode
				while(node!=endNode){
					//search range
					var startX:uint=Math.max(0,node.x-1)
					var endX:uint=Math.min(grid.numCols-1,node.x+1)
					var startY:uint=Math.max(0,node.y-1)
					var endY:uint=Math.min(grid.numRows-1,node.y+1)
					for (var i:int = startX; i <= endX; i++) 
					{
						for (var j:int = startY; j <= endY; j++) 
						{
							var test:Node=grid.getNode(i,j)
							if(test==node || !test.walkable 
								|| !grid.getNode(test.x,node.y).walkable || !grid.getNode(test.x,node.y).walkable){
								continue;
							}
								var cost:Number=straightCost
							if(!(node.x==test.x || node.y==test.y)){
								cost=diagCost
							}
							var g:Number=node.g+(cost*test.costMultiplier);
							var h:Number=heuristic(test);
							var f:Number=g+h;
							if(isOpen(test) || isClosed(test)){
								if(test.f>f){
									test.g=g;
									test.h=h;
									test.parent=node;
								}
							}else{
								test.g=g;
								test.h=h;
								test.parent=node;
								open.push(test);
							}
						}
					}
					closed.push(node);
					if(open.length==0){
						return false
					}
					open.sort(function(a:Node,b:Node):int{
						if(a.f==b.f){
							return 0
						}
						return a.f>b.f?1:-1
					});
					node=open.shift();
				}
				buildPath();
				return true;
		}
		
		private function buildPath():void
		{
			path=new Vector.<Node>();
			var node:Node=endNode;
			while(node!=startNode){
				path.unshift(node)
				node=node.parent
			}
		}
		
		private function heuristic(node:Node):Number{
			var dx:int,dy:int
			switch(_heuristicType){
				case HEURISTIC_MANHATAN:
					return Math.abs(node.x-endNode.x)*straightCost+Math.abs(node.y-endNode.y)*straightCost
					break;
				case HEURISTIC_EUCLIDIAN:
					dx=node.x-endNode.x
					dy=node.y-endNode.y;
					return Math.sqrt(dx*dx+dy*dy)*straightCost
					break;
				case HEURISTIC_DIAGONAL:
					dx=Math.abs(node.x-endNode.x);
					dy=Math.abs(node.y-endNode.y);
					var diag:int=Math.min(dx,dy)
					var straight:int=dx+dy
					return diagCost*diag+straightCost*(straight-2*diag)
					break;
			}
			throw new Error("Not found heuristic type "+_heuristicType)
			return 0
		}
		private function isOpen(node:Node):Boolean{
			return open.indexOf(node)>-1
		}
		private function isClosed(node:Node):Boolean{
			return closed.indexOf(node)>-1
		}
		public function get visited():Vector.<Node>{
			return closed.concat(open)
		}
	}
}