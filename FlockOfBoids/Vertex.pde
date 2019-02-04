/*
* A class representing an standalone vertex
*/
public class Vertex {
  
  ArrayList<Integer> coordinates;

  Vertex(Integer x, Integer y, Integer z)
  {
    this.coordinates = new ArrayList();
    this.coordinates.add(x);
    this.coordinates.add(y);
    this.coordinates.add(z);
  }
  
  public ArrayList<Integer> get() {
    return this.coordinates;
  }
  
  public Integer get(Integer position) {
    return this.coordinates.get(position);
  }
  
  public void set(Integer x, Integer y, Integer z) {
    this.coordinates.set(0, x);
    this.coordinates.set(1, y);
    this.coordinates.set(2, z);
  }
}
