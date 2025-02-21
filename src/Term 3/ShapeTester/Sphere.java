public class Sphere 
{
    private double radius = 0;
    
    public Sphere(double thisRadius)
    {
        radius = thisRadius;
    }
    
    public double getVolume()
    {
        return 1.333333333 * Math.PI * Math.pow(radius, 3);
    }
    
    public double getSurfaceArea()
    {
        return 4 * Math.PI * Math.pow(radius, 2);
    }
}
