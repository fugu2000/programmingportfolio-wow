public class Pyramid 
{
    private double width, length, height = 0;
    
    public Pyramid(double thisWidth, double thisLength, double thisHeight)
    {
        width = thisWidth;
        length = thisLength;
        height = thisHeight;
    }
    
    public double getVolume()
    {
        return (length * width * height) / 3;
    }
    public double getSurfaceArea()
    {
        return length * width + length * Math.sqrt(Math.pow((width / 2), 2) + Math.pow(height , 2)) + width * Math.sqrt(Math.pow((length / 2), 2) + Math.pow(height, 2));
    }
}
