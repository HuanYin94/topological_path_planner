package roadmodel;

import java.util.List;

public class Node {
	public int getAtMap() {
		return atMap;
	}
	public void setAtMap(int atMap) {
		this.atMap = atMap;
	}
	public String getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}
	public List<String> getEventList() {
		return eventList;
	}
	public void setEventList(List<String> eventList) {
		this.eventList = eventList;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public double[] getPose() {
		return pose;
	}
	public void setPose(double[] pose) {
		this.pose = pose;
	}
	private int atMap;
	private String categoryID;
	private List<String> eventList;
	private int ID;
	private double[] pose = new double[6];
}
