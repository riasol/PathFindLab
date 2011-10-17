package eu.riasol.algoritm.astar
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class GridView extends Sprite
	{
		private var grid:Grid
		private var _cellSize:Number=10
		public function GridView(grid:Grid)
		{
			this.grid=grid;
			drawGrid();
			findPath();
			addEventListener(MouseEvent.CLICK,onGridClick)
		}
		
		private function findPath():void
		{
			var astar:AStar=new AStar()
				if(astar.findPath(grid)){
					showVisited(astar)
					showPath(astar)
				}
		}
		
		private function showPath(astar:AStar):void
		{
			var path:Vector.<Node>=astar.path;
			for each (var node:Node in path) 
			{
				graphics.beginFill(0xffffff);
				graphics.drawCircle(node.x*_cellSize+_cellSize/2,node.y*_cellSize+_cellSize/2,_cellSize/2);
				graphics.endFill();
			}
		}
		
		private function showVisited(astar:AStar):void
		{
			var visited:Vector.<Node>=astar.visited;
			for each (var node:Node in visited) 
			{
				graphics.beginFill(0xcccccc);
				graphics.drawRect(node.x*_cellSize,node.y*_cellSize,_cellSize,_cellSize);
				graphics.endFill();
			}
		}
		
		private function drawGrid():void
		{
			graphics.clear()
			graphics.lineStyle(0)
			for (var i:int = 0; i < grid.numCols; i++) 
			{
				for (var j:int = 0; j < grid.numRows; j++) 
				{
					var node:Node=grid.getNode(i,j)
					graphics.beginFill(getColor(node))
					graphics.drawRect(_cellSize*i,_cellSize*j,_cellSize,_cellSize)
				}
				
			}
			
			
		}
		
		private function getColor(node:Node):uint
		{
			if(!node.walkable){
				return 0xff0000
			}
			if(node==grid.startNode){
				return 0x00ff00
			}
			if(node==grid.endNode){
				return 0x0000ff
			}
			return 0;
		}
		
		protected function onGridClick(event:MouseEvent):void
		{
			var xPos:int=Math.floor(event.localX/_cellSize)
			var yPos:int=Math.floor(event.localY/_cellSize)
			var node:Node=grid.getNode(xPos,yPos)
			node.walkable=!node.walkable
			drawGrid()
			findPath()
		}
	}
}