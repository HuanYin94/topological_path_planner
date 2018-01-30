package roadmodel;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class RMFeeder {
	public void feed(String fn1, String fn2, RoadModel rm) {
        // read edge
		ArrayList<Edge> es = new ArrayList<Edge>();        
		File file = new File(fn1);
        BufferedReader reader = null;
        String tempString = null;
        try {
            reader = new BufferedReader(new FileReader(file));
            while ((tempString = reader.readLine()) != null) {
            	String[] token = tempString.split("\\s+");
               	Edge e = new Edge();
        		int IDdest = Integer.parseInt(token[1]);
        		int IDsource = Integer.parseInt(token[2]);
        		boolean unidirected = false;
        		e.setIDdest(IDdest);
        		e.setIDsource(IDsource);
        		e.setUnidirected(unidirected);
        		es.add(e);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		
        // read node
		HashMap<String, String> dictE = new HashMap<String, String>();
		HashMap<String, String> dictC = new HashMap<String, String>();
		ArrayList<Node> ns = new ArrayList<Node>();
		file = new File(fn2);
        reader = null;
		try {
            reader = new BufferedReader(new FileReader(file));
            while ((tempString = reader.readLine()) != null) {
            	String[] token = tempString.split("\\s+");
            	Node n = new Node();
        		int atMap = Integer.parseInt(token[4]); //Integer.parseInt(token[]);
        		String categoryID = "0";
        		if (!dictC.containsKey(categoryID))
        			dictC.put(categoryID, " ");
        		ArrayList<String> eventList = new ArrayList<String>();
        		eventList.add(token[5]);
        		for (String item:eventList) {
        			if (!dictE.containsKey(item))
            			dictE.put(item, " ");
        		}
        		int ID = Integer.parseInt(token[0]);
        		double[] pose = {Double.parseDouble(token[1]),Double.parseDouble(token[2]),Double.parseDouble(token[3]),
        				1.0,0.0,0.0,0.0};
        		n.setAtMap(atMap);
        		n.setCategoryID(categoryID);
        		n.setEventList(eventList);
        		n.setID(ID);
        		n.setPose(pose);
        		ns.add(n);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		
		// set rm
		rm.setNodes(ns);
		rm.setEdges(es);
		rm.setDictEvent(dictE);
		rm.setDictCategory(dictC);
	}	
}
