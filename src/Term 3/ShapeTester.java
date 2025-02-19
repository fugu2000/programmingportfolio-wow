import java.util.Scanner;

public class ShapeTester
{
    public static void main(String[] args)
    {
        double bWidth = 0;
        double bHeight = 0;
        double bLength = 0;
        double sRadius = 0;
        double pHeight = 0;
        double pWidth = 0;
        double pLength = 0;
        double cRadius = 0;
        double cHeight = 0;
        boolean run = true;
        boolean ask = true;
        boolean check1 = true;
        while(run)
        {
            System.out.println("Welcome to shape maker! Let's find the volume and surface area for a few shapes...");
            System.out.println("To build a box, press 1. To build a sphere, press 2.");
            System.out.println("To build a pyramid, press 3. To build a cylinder, press 4.");
            Scanner selection = new Scanner(System.in);
            if(selection.hasNextInt())
            {
                int selected = selection.nextInt();
                if (selected == 1)
                {
                    System.out.println("Great! Let's start with a box. Please enter the width of the box:");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            bWidth = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    check1 = true;
                    System.out.println("Please enter the height of the box: ");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            bHeight = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    check1 = true;
                    System.out.println("Please enter the length of the box: ");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            bLength = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    
                    Box b1 = new Box(bWidth, bLength, bHeight);
                    System.out.println("The volume for your box: " + b1.getVolume());
                    System.out.println("The surface area for your box: " + b1.getSurfaceArea());
                    ask = true;
                    while (ask)
                    {
                        System.out.println("Would you like to run again? Type true of false");
                        selection.nextLine();
                        if(selection.hasNextBoolean())
                        {
                            run = selection.nextBoolean();
                            ask = false;
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                }
                else if(selected == 2)
                {
                    System.out.println("Great! Let's start with a sphere. Please enter the radius of the sphere:");
                    
                    check1 = true;
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            
                            sRadius = selection.nextDouble();
                        
                            Sphere s1 = new Sphere(sRadius);
                            System.out.println("The volume for your sphere: " + s1.getVolume());
                            System.out.println("The surface area for your sphere: " + s1.getSurfaceArea());
                            ask = true;
                            while (ask)
                            {
                                System.out.println("Would you like to run again? Type true of false");
                                Scanner confirm = new Scanner(System.in);
                                if(confirm.hasNextBoolean())
                                {
                                    run = confirm.nextBoolean();
                                    ask = false;
                                }
                                else
                                {
                                    System.out.println("ENTER VALID INPUT");
                                }
                            }
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    
                }
                else if(selected == 3)
                {
                    System.out.println("Great! Let's start with a Pyramid. Please enter the width of the Pyramid:");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            pWidth = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    check1 = true;
                    System.out.println("Please enter the height of the Pyramid: ");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            pHeight = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    check1 = true;
                    System.out.println("Please enter the length of the Pyramid: ");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            pLength = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    
                    Pyramid p1 = new Pyramid(pWidth, pLength, pHeight);
                    System.out.println("The volume for your pyramid: " + p1.getVolume());
                    System.out.println("The surface area for your pyramid: " + p1.getSurfaceArea());
                    ask = true;
                    while (ask)
                    {
                        System.out.println("Would you like to run again? Type true of false");
                        selection.nextLine();
                        if(selection.hasNextBoolean())
                        {
                            run = selection.nextBoolean();
                            ask = false;
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                }
                else if(selected == 4)
                {
                    System.out.println("Great! Let's start with a Cylinder. Please enter the radius of the Cylinder:");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            cRadius = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    check1 = true;
                    System.out.println("Please enter the height of the Cylinder: ");
                    while(check1)
                    {
                        selection.nextLine();
                        if(selection.hasNextDouble())
                        {
                            check1 = false;
                            cHeight = selection.nextDouble();
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                    Cylinder c1 = new Cylinder(cRadius, cHeight);
                    System.out.println("The volume for your Cylinder: " + c1.getVolume());
                    System.out.println("The surface area for your Cylinder: " + c1.getSurfaceArea());
                    ask = true;
                    while (ask)
                    {
                        System.out.println("Would you like to run again? Type true of false");
                        selection.nextLine();
                        if(selection.hasNextBoolean())
                        {
                            run = selection.nextBoolean();
                            ask = false;
                        }
                        else
                        {
                            System.out.println("ENTER VALID INPUT");
                        }
                    }
                }
                else
                {
                    System.out.println("ENTER VALID INPUT");
                }
            }
            
            else
            {
                System.out.println("ENTER VALID INPUT");
            }
        }
    }
}
