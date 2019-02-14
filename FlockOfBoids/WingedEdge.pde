/*
* Implementation of FaceVertex Mesh Representation
*/
import java.util.Iterator;

public class WingedEdge {
  // Accordingly to definition, we store a face list with corresponding edges
  // Integers are used to uniquely identify faces
  HashMap<Vertex, ArrayList<Integer>> faceList;
  // Definition also requires us to store a vertex list with edges
  HashMap<Vertex, ArrayList<Integer>> vertexList;
  // Definition also requires us to store a edges List with vectors and faces
  HashMap<Integer, Vertex[]> edgeList;
  
  ArrayList<Vertex> visited;
  
  WingedEdge() {
    this.vertexList = new HashMap();
    this.faceList = new HashMap();
    this.edgeList = new HashMap();
    this.visited = new ArrayList();
  }
  
  public void addFace(Integer id, Vertex[] vertexes) { 
    this.edgeList.put(id, vertexes);
    for (int i = 0; i < vertexes.length; i++) {
      if (this.vertexList.get(vertexes[i]) != null){
        ArrayList<Integer> vertexFaceList = this.vertexList.get(vertexes[i]);
        if (!vertexFaceList.contains(id)) {
          vertexFaceList.add(id);
        }
      } else {
        ArrayList<Integer> vertexFaceList = new ArrayList();
        vertexFaceList.add(id);
        this.vertexList.put(vertexes[i], vertexFaceList);
      }
    }
  }
  
  /* 
   * renderingModes
   */
  public void renderImmediate() {
    Iterator<HashMap.Entry<Integer, Vertex[]>> iterator = this.edgeList.entrySet().iterator();
    beginShape();
    while (iterator.hasNext()) {
      HashMap.Entry<Integer, Vertex[]> item = iterator.next();
      Vertex[] vertexes = item.getValue();
      for (int i = 0; i < vertexes.length; i++) {
        if(visited.contains(vertexes[i]) == false) {
          vertex(vertexes[i].get(0), vertexes[i].get(1), vertexes[i].get(2));
        }
      }
    }
    endShape();
  }
  
  public PShape renderRetained() {
    PShape s = createShape();
    s.beginShape();
    Iterator<HashMap.Entry<Integer, Vertex[]>> iterator = this.edgeList.entrySet().iterator();
    while (iterator.hasNext()) {
      HashMap.Entry<Integer, Vertex[]> item = iterator.next();
      Vertex[] vertexes = item.getValue();
      for (int i = 0; i < vertexes.length; i++) {
        s.vertex(vertexes[i].get(0), vertexes[i].get(1), vertexes[i].get(2));
      }
    }
    s.endShape();
    return s;
  }
}
