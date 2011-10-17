package flexUnitTests
{
	import eu.riasol.algoritm.astar.AStar;
	import eu.riasol.algoritm.astar.Grid;
	
	
	import org.flexunit.Assert;
	
	public class AStarTest
	{		
		
		[Test]
		public function testAStar():void
		{
			var ins:AStar=new AStar()
		}
		[Test]
		public function testFind():void
		{
			var ins:AStar=new AStar()
			var grid:Grid=new Grid(3,4)
			grid.setStartNode(0,0)
			grid.setEndNode(2,0)
			var finded:Boolean=ins.findPath(grid)
			Assert.assertTrue(finded);
			Assert.assertEquals('x',1,ins.path[0].x)
			Assert.assertEquals('y',0,ins.path[0].y)
				
		}
		
	}
}