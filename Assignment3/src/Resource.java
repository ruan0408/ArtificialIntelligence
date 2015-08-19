/*
By:

Gervasio Protasio dos Santos Neto - 5050769
Ruan De Menezes Costa - 5050761
*/

/*
  Class to represent Gold, Dynamites and Axe
*/

public class Resource{

	private Position resourcePosition;
    
	protected Resource(int r, int c) {
		resourcePosition = new Position(r,c);
	}

	public Position getPosition() {
		return resourcePosition;
	}
}
