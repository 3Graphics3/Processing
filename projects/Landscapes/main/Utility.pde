class Utility
{

  private int sideLength;
  private float deltaR;

  /* Constructor definition */
  public Utility(int sideLength)
  {
    this.sideLength = sideLength;
    this.deltaR = 0.5 * this.sideLength;
  }

  /* Function definition */
  public HashMap<String, ArrayList<Vertice>> constructPointMap(PVector position)
  {
    var pointMap = new HashMap<String, ArrayList<Vertice>>();

    var top = this.constructVertice(position, new PVector(this.sideLength / 2, 0));
    var right = this.constructVertice(position, new PVector(this.sideLength, this.sideLength / 2));
    var left = this.constructVertice(position, new PVector(0, this.sideLength / 2));
    var bottom = this.constructVertice(position, new PVector(this.sideLength / 2, this.sideLength));

    pointMap.put("1100", new ArrayList<Vertice>() {
      {
        add(left);
        add(right);
      }
    }
    );
    pointMap.put("0011", new ArrayList<Vertice>() {
      {
        add(left);
        add(right);
      }
    }
    );
    pointMap.put("1101", new ArrayList<Vertice>() {
      {
        add(bottom);
        add(right);
      }
    }
    );
    pointMap.put("0010", new ArrayList<Vertice>() {
      {
        add(bottom);
        add(right);
      }
    }
    );
    pointMap.put("1110", new ArrayList<Vertice>() {
      {
        add(left);
        add(bottom);
      }
    }
    );
    pointMap.put("0001", new ArrayList<Vertice>() {
      {
        add(left);
        add(bottom);
      }
    }
    );
    pointMap.put("1111", new ArrayList<Vertice>() {
      {
      }
    }
    );
    pointMap.put("0000", new ArrayList<Vertice>() {
      {
      }
    }
    );
    pointMap.put("1000", new ArrayList<Vertice>() {
      {
        add(left);
        add(top);
      }
    }
    );
    pointMap.put("0111", new ArrayList<Vertice>() {
      {
        add(left);
        add(top);
      }
    }
    );
    pointMap.put("1001", new ArrayList<Vertice>() {
      {
        add(top);
        add(bottom);
      }
    }
    );
    pointMap.put("0110", new ArrayList<Vertice>() {
      {
        add(top);
        add(bottom);
      }
    }
    );
    pointMap.put("1010", new ArrayList<Vertice>() {
      {
        add(left);
        add(top);
        add(right);
        add(bottom);
      }
    }
    );
    pointMap.put("0101", new ArrayList<Vertice>() {
      {
        add(left);
        add(top);
        add(right);
        add(bottom);
      }
    }
    );
    pointMap.put("1011", new ArrayList<Vertice>() {
      {
        add(top);
        add(right);
      }
    }
    );
    pointMap.put("0100", new ArrayList<Vertice>() {
      {
        add(top);
        add(right);
      }
    }
    );

    return pointMap;
  }

  private Vertice constructVertice(PVector position, PVector delta)
  {
    var posX = position.x + delta.x;
    var posY = position.y + delta.y;
    var origin = new PVector(posX, posY);
    var radius = this.deltaR * this.sideLength;
    var weight = 0;

    return new Vertice(origin, radius, weight);
  }

  public void pointLine(PVector pointA, PVector pointB)
  {
    line(pointA.x, pointA.y, pointB.x, pointB.y);
  }

  public String toStringArray(int[] integerArray)
  {
    var stringBuilder = new StringBuilder();
    
    for (var integer : integerArray)
    {
      var stringInteger = String.valueOf(integer);
      stringBuilder.append(stringInteger);
    }

    return stringBuilder.toString();
  }
}
