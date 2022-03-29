public class DirectedEdge
{
  int idStart, idEnd;
  DirectedEdge(int idStart_, int idEnd_)
  {
    idStart = idStart_;
    idEnd = idEnd_;
  }
  public void show(ArrayList<Vertex> e)
  {
    PVector r_start = e.get(idStart).r;
    PVector r_end = e.get(idEnd).r;

    stroke(244);
    line(r_start.x, r_start.y, r_end.x, r_end.y);
  }
}
