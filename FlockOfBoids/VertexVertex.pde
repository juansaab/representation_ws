/*
* Implementation of Vertex Vertex Mesh Representation
*/
import java.util.Iterator;

public class VertexVertex {
  // Accordingly to definition, we store a vector an a list of its neighbourghs
  HashMap<Vertex, Vertex[]> vertexList;
  
  VertexVertex() {
    this.vertexList = new HashMap();
  }
  
  public void put(Vertex v, Vertex[] neighbours) {
    this.vertexList.put(v, neighbours);
  }
  
  
  /* 
   * renderingModes
   */
  public void renderImmediate() {
    beginShape();
    Iterator<HashMap.Entry<Vertex, Vertex[]>> iterator = this.vertexList.entrySet().iterator();
    while (iterator.hasNext()) {
      HashMap.Entry<Vertex, Vertex[]> item = iterator.next();
      Vertex v = item.getKey();
      Vertex[] neighbours = item.getValue();
      vertex(v.get(0), v.get(1), v.get(2));
      for (int i = 0; i < neighbours.length; i++) {
          Vertex neighbour = neighbours[i];
          vertex(neighbour.get(0), neighbour.get(1), neighbour.get(2));
      }
    }
    endShape();
  }
  
  public PShape renderRetained() {
    PShape s = createShape();
    s.beginShape();
    Iterator<HashMap.Entry<Vertex, Vertex[]>> iterator = this.vertexList.entrySet().iterator();
    while (iterator.hasNext()) {
      HashMap.Entry<Vertex, Vertex[]> item = iterator.next();
      Vertex v = item.getKey();
      Vertex[] neighbours = item.getValue();
      s.vertex(v.get(0), v.get(1), v.get(2));
      for (int i = 0; i < neighbours.length; i++) {
          Vertex neighbour = neighbours[i];
          s.vertex(neighbour.get(0), neighbour.get(1), neighbour.get(2));
      }
    }
    s.endShape(CLOSE);
    return s;
  }
}
