public class Network
{
  ArrayList<Vertex> verteces;
  ArrayList<DirectedEdge> edges;
  Network(boolean init)
  {
    if (init)
    {
      initialize();
    } else
    {
      init_washout();
    }
  }

  private void initialize()
  {
    verteces = new ArrayList<Vertex>();
    edges = new ArrayList<DirectedEdge>();

    float angle = - HALF_PI;
    float radius = 250;

    verteces.add(new Vertex(width*0.5, height*0.5, width*0.5 + radius * cos(angle), height*0.5 + radius * sin(angle)));
    angle -= PI * 2/3.;
    verteces.add(new Vertex(width*0.5, height*0.5, width*0.5 + radius * cos(angle), height*0.5 + radius * sin(angle)));
    
    edges.add(new DirectedEdge(0, 1));
    edges.add(new DirectedEdge(1, 2));
    
  }
  private void init_washout()
  {
    verteces = new ArrayList<Vertex>();
    edges = new ArrayList<DirectedEdge>();
  }

  void show()
  {
    //for (Vertex v : verteces)
    //{
    //  v.show();
    //}
    for (DirectedEdge e : edges)
    {
      e.show(verteces);
    }
  }
  void move()
  {
    for (Vertex v : verteces)
    {
      v.update();
    }
  }
}
