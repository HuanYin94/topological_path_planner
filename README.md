## Matlab UI Tool

select points manually

v1.0

![](https://github.com/ZJUYH/topological_path_planner/raw/master/img/img.png)

v2.0 with GUI

![](https://github.com/ZJUYH/topological_path_planner/raw/master/img/vvv.png)

## HOW TO USE IT

A point(pose7) = 3 XYZ + 4 quantn + TURN BIT + FORK BIT + ID

Edge = ID1 + ID2

BUTTON:

lOAD RAW DATA:		LOAD from workspace

REFRESH:		Re-draw everything(edges, points, id)

ADD PATH-POINTS:	Add path-points

REMOVE PATH-POINTS:	Remove path-points, need refresh after cliked several times(ENter)

ADD TURN-POINTS:	NO USE NOW

REMOVE TURN-POINTS:	NO USE NOW

ADD FORK-POINTS:	FORK BIT OF A POINT IS SET TO 1

REMOVE TURN-POINTS:	SET TO 0

ADD EDGES: 		SELECT 2 points, Add to the edgeLists

REMOVE EDGES:		SELECT 2 points, REMOVE the edges from edgeLists

Auto EDGES:  		CAREFUL, generate the edges according to ID in pose7?

Load LIST:		LOAD the result from outside 2 txts

EXPORT:			To see something
