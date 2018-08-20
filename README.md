## Matlab UI Tool

select points manually

v1.0

![](https://github.com/ZJUYH/topological_path_planner/raw/master/img/img.png)

v2.0 with GUI

![](https://github.com/ZJUYH/topological_path_planner/raw/master/img/vvv.png)

## HOW TO USE IT

A point(pose7) = 3 XYZ + 4 quantn + TURN BIT + FORK BIT + ID

Edge = ID1, ID2

### BUTTON:

`load Raw Data`	LOAD from workspace

`Refresh`:		         Re-draw everything(edges, points, id)

`Add Path-Points`	     Add path-points

`Remove Path-Points`	 Remove path-points, need refresh after cliked several times(ENter)

`Add Turn-Points`	     Not used now

`Remove Turn-Points`	 Not used now

`ADD Fork-Points`      Fork bit of a path-point is set as 1

`Remove Turn-Points`	 Set as 0

`Add Edges`	           Select 2 points, add to the edgeLists

`Remove Edges`      	 Select 2 points, remove the edges from edgeLists

`Auto Edges`  		     Be careful, generate the edges according to the order IDs(pose7)

`Load List`		         LOAD the result from outside 2 txts

`Export`        			 To see something
