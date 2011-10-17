package
{
	import eu.riasol.algoritm.astar.Grid;
	import eu.riasol.algoritm.astar.GridView;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	[SWF(width=1000, height=800)]
	public class AStartSimpleDemo extends Sprite
	{
		function AStartSimpleDemo(){
		stage.align=StageAlign.TOP_LEFT;
		stage.scaleMode=StageScaleMode.NO_SCALE
		var	grid:Grid=new Grid(50,30);
		grid.setStartNode(0,0);
		grid.setEndNode(49,29);
		var gridView:GridView=new GridView(grid);
		addChild(gridView)
		}
	}
}