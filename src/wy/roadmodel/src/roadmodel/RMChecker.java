package roadmodel;

import java.util.HashSet;

public class RMChecker {
	public boolean check(RoadModel rm){
		// check nodes/edges consistency
		HashSet<Integer> hsn = new HashSet<Integer>();
		HashSet<Integer> hse = new HashSet<Integer>();
		for (Node n:rm.getNodes())
			hsn.add(n.getID());
		for (Edge e:rm.getEdges()) {
			if (!hse.contains(e.getIDsource()))
				hse.add(e.getIDsource());
			if (!hse.contains(e.getIDdest()))
				hse.add(e.getIDdest());
		}
		for (int key:hsn){
			if (!hse.contains(key)) {
				System.out.println("Road model has isolated node."+key);
				return false;
			}
		}
		for (int key:hse){
			if (!hsn.contains(key)) {
				System.out.println("Road model has edge connecting to undefined node. "+key);
				return false;
			}
		}
		
		// check dictionary consistency
		HashSet<String> dictC = new HashSet<String>();
		HashSet<String> dictE = new HashSet<String>();
		for (Node n:rm.getNodes()){
			for (String event:n.getEventList())
				dictE.add(event);
			dictC.add(n.getCategoryID());
		}
		for (String event:dictE){
			if (!rm.getDictEvent().containsKey(event)){
				System.out.println("Road model has undefined event id in the event dictionary.");
				return false;
			}
		}
		for (String cate:dictC){
			if (!rm.getDictCategory().containsKey(cate)){
				System.out.println("Road model has undefined category id in the category dictionary.");
				return false;
			}
		}
		/*for (String event:rm.getDictEvent().keySet()){
			if (!dictE.contains(event))
				return false;
		}
		for (String cate:rm.getDictCategory().keySet()){
			if (!dictC.contains(cate))
				return false;
		}*/

		// check empty terms in the dictionary
		for (String event:rm.getDictEvent().keySet()){
			if (rm.getDictEvent().get(event).equals(null)){
				System.out.println("Road model has null description of event term "+event);
				return false;
			}
		}
		for (String cate:rm.getDictCategory().keySet()){
			if (rm.getDictCategory().get(cate).equals(null)){
				System.out.println("Road model has null description of category term "+cate);
				return false;
			}
		} 
		
		return true;
	}
}
