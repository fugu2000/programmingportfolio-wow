public class Box 
{
    private double length, width, height = 0;
    
    public Box(double thisWidth, double thisLength, double thisHeight)
    {
        width = thisWidth;
        length = thisLength;
        height = thisHeight;
    }
    
    public double getVolume()
    {
        return length * width * height;
    }
    public double getSurfaceArea()
    {
        return 2 * (width * length + height * length + height * width);
    }
}
