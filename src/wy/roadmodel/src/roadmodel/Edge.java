package roadmodel;

public class Edge {
	public int getIDdest() {
		return IDdest;
	}
	public void setIDdest(int iDdest) {
		IDdest = iDdest;
	}
	public int getIDsource() {
		return IDsource;
	}
	public void setIDsource(int iDsource) {
		IDsource = iDsource;
	}
	public boolean isUnidirected() {
		return unidirected;
	}
	public void setUnidirected(boolean unidirected) {
		this.unidirected = unidirected;
	}
	private int IDdest;
	private int IDsource;
	private boolean unidirected;
}
