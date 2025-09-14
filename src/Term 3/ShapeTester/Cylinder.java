public class Cylinder 
{
    private double radius, height = 0;
    
    public Cylinder(double thisRadius, double thisHeight)
    {
        radius = thisRadius;
        height = thisHeight;
    }
    
    public double getVolume()
    {
        return Math.PI * Math.pow(radius, 2) * height;
    }
    public double getSurfaceArea()
    {
        return 2 * Math.PI * radius *  height + 2 * Math.PI * Math.pow(radius, 2);
    }
}
