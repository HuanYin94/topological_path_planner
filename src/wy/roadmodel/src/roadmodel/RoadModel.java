package roadmodel;

import java.util.List;
import java.util.Map;

public class RoadModel {
	public List<Node> getNodes() {
		return nodes;
	}
	public void setNodes(List<Node> nodes) {
		this.nodes = nodes;
	}
	public List<Edge> getEdges() {
		return edges;
	}
	public void setEdges(List<Edge> edges) {
		this.edges = edges;
	}
	public Map<String, String> getDictCategory() {
		return dictCategory;
	}
	public void setDictCategory(Map<String, String> dictCategory) {
		this.dictCategory = dictCategory;
	}
	public Map<String, String> getDictEvent() {
		return dictEvent;
	}
	public void setDictEvent(Map<String, String> dictEvent) {
		this.dictEvent = dictEvent;
	}
	private List<Node> nodes;
	private List<Edge> edges;
	private Map<String, String> dictCategory;
	private Map<String, String> dictEvent;
}
