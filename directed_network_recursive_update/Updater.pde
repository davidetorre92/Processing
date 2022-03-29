public class Updater
{
  Updater()
  {
  }
  public Network update(Network oldNetwork)
  {
    Network newNetwork = new Network(false);
    int size = oldNetwork.verteces.size();
    int addedVerteces = 0;
    for(DirectedEdge e : oldNetwork.edges)
    {
      PVector r_start, r_end;
      r_start = oldNetwork.verteces.get(e.idStart).r_end;
      r_end = oldNetwork.verteces.get(e.idEnd).r_end;
      
      PVector[] newVerteces = new PVector[4];
      PVector[] birthPosition = new PVector[4];
      birthPosition[0] = PVector.sub(r_end, r_start).mult(1./3).add(r_start);
      birthPosition[1] = birthPosition[0].copy();
      birthPosition[2] = PVector.sub(r_end, r_start).mult(2./3).add(r_start);
      birthPosition[3] = birthPosition[2].copy();
      newVerteces[0] = PVector.sub(r_end, r_start).mult(1/3.).add(r_start);
      newVerteces[1] = PVector.sub(r_end, r_start).rotate(HALF_PI*0.5).mult(sqrt(2)/3.).add(r_start);
      newVerteces[2] = PVector.sub(r_end, r_start).rotate(HALF_PI*0.25).mult(sqrt(2)/3.).add(r_start);
      newVerteces[3] = PVector.sub(r_end, r_start).mult(2./3).add(r_start);
      
      
      newNetwork.verteces.add(new Vertex(birthPosition[0].x, birthPosition[0].y, newVerteces[0].x, newVerteces[0].y)); 
      newNetwork.verteces.add(new Vertex(birthPosition[1].x, birthPosition[1].y, newVerteces[1].x,newVerteces[1].y));
      newNetwork.verteces.add(new Vertex(birthPosition[2].x, birthPosition[2].y, newVerteces[2].x,newVerteces[2].y));
      newNetwork.verteces.add(new Vertex(birthPosition[3].x, birthPosition[3].y, newVerteces[3].x,newVerteces[3].y));
      addedVerteces += 4;
      newNetwork.edges.add(new DirectedEdge(e.idStart, addedVerteces-4+size));
      newNetwork.edges.add(new DirectedEdge(addedVerteces-4+size, addedVerteces-3+size));
      newNetwork.edges.add(new DirectedEdge(addedVerteces-3+size, addedVerteces-2+size));
      newNetwork.edges.add(new DirectedEdge(addedVerteces-2+size, addedVerteces-1+size));
      newNetwork.edges.add(new DirectedEdge(addedVerteces-1+size, e.idEnd));
    }
    
    oldNetwork.edges = new ArrayList<DirectedEdge>(); //Remove old edges
    
    for(Vertex new_v : newNetwork.verteces)
    {
      oldNetwork.verteces.add(new_v);
    }
    for(DirectedEdge new_e : newNetwork.edges)
    {
      oldNetwork.edges.add(new_e);
    }
    return oldNetwork;
  }
}
