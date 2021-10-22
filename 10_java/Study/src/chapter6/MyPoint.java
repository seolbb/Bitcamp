package chapter6;

public class MyPoint {
	int x;
	int y;
	
	public MyPoint(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}
	
	double getDistance(int x1, int y1) {
		
		return Math.sqrt((x - x1) * (x - x1) + (y - y1) * (y - y1));
	}
	
}
