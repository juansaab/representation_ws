/*
* Implementation of FaceVertex Mesh Representation
*/
import java.util.Iterator;

public class FaceVertex {
  // Accordingly to definition, we store a vector list with corresponding faces
  // Integers are used to uniquely identify faces
  HashMap<Vertex, ArrayList<Integer>> vertexList;
  // Definition also requires us to store a faces list
  HashMap<Integer, Vertex[]> faceList;
  
  FaceVertex() {
    this.vertexList = new HashMap();
    this.faceList = new HashMap();
  }
  
  public void addFace(Integer id, Vertex[] vertexes) { 
    this.faceList.put(id, vertexes);
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
    Iterator<HashMap.Entry<Integer, Vertex[]>> iterator = this.faceList.entrySet().iterator();
    while (iterator.hasNext()) {
      HashMap.Entry<Integer, Vertex[]> item = iterator.next();
      Vertex[] vertexes = item.getValue();
      beginShape();
      for (int i = 0; i < vertexes.length; i++) {
        vertex(vertexes[i].get(0), vertexes[i].get(1), vertexes[i].get(2));
      }
      endShape();
    }
  }
  
  public PShape renderRetained() {
    PShape s = createShape();
    s.beginShape();
    Iterator<HashMap.Entry<Integer, Vertex[]>> iterator = this.faceList.entrySet().iterator();
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
