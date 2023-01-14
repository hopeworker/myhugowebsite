

## Exception

Learning the art of programming, like most other disciplines, consists of first learning the rules and then learning when to break them.

If you believe a condition is likely to allow for recovery, use a checked exception; 
if not, use a runtime exception. 
If it isn’t clear whether recovery is possible, you’re probably better off using an unchecked exception.


This burden may be justified 
if the exceptional condition cannot be prevented by proper use of the API 
and the programmer using the API can take some useful action once confronted with the exception. 
Unless both of these conditions are met, an unchecked exception is appropriate. 


In summary, when used sparingly, checked exceptions can increase the reliability of programs; 
when overused, they make APIs painful to use. 
If callers won’t be able to recover from failures, throw unchecked exceptions. 
If recovery may be possible and you want to force callers to handle exceptional conditions, 
first consider returning an optional. 
Only if this would provide insufficient information in the case of failure should you throw a checked exception.


Under these circumstances, 
the rule is to throw IllegalStateException if no argument values would have worked,
otherwise throw IllegalArgumentException.


To avoid this problem, higher layers should catch lower-level exceptions and, 
in their place, throw exceptions that can be explained in terms of the higher-level abstraction.
This idiom is known as exception translation:


If it is impossible to prevent exceptions from lower layers, 
the next best thing is to have the higher layer silently work around these exceptions,
insulating the caller of the higher-level method from lower-level problems. 
Under these circumstances, it may be appropriate to log the exception using some appropriate logging facility such as java.util.logging. 
This allows programmers to investigate the problem, while insulating client code and the users from it.


Ignoring an exception is analogous to ignoring a fire alarm—and turning it off so no one else gets a chance to see if there’s a real fire. 


If you choose to ignore an exception, 
the catch block should contain a comment explaining why it is appropriate to do so, 
and the variable should be named ignored:

```java
Future<Integer> f = exec.submit(planarMap::chromaticNumber);
int numColors = 4; // Default; guaranteed sufficient for any map
try {
    numColors = f.get(1L, TimeUnit.SECONDS);
} catch (TimeoutException | ExecutionException ignored) {
    // Use default: minimal coloring is desirable, not required
}
```


## Enum
The basic idea behind Java’s enum types is simple: 
they are classes that export one instance for each enumeration constant via a public static final field.

The numbers in parentheses after each enum constant are parameters that are passed to its constructor.

```java
public enum Planet {
    MERCURY(3.302e+23, 2.439e6),
    VENUS  (4.869e+24, 6.052e6),
    EARTH  (5.975e+24, 6.378e6),

    private final double mass;           // In kilograms
    private final double radius;         // In meters
    private final double surfaceGravity; // In m / s^2

    // Universal gravitational constant in m^3 / kg s^2
    private static final double G = 6.67300E-11;

    // Constructor
    Planet(double mass, double radius) {
        this.mass = mass;
        this.radius = radius;
        surfaceGravity = G * mass / (radius * radius);
    }

    public double surfaceGravity() { return surfaceGravity; }

    public double surfaceWeight(double mass) {
        return mass * surfaceGravity;  // F = ma
    }
}

```

```java
public class WeightTable {
   public static void main(String[] args) {
      double earthWeight = Double.parseDouble(args[0]);
      double mass = earthWeight / Planet.EARTH.surfaceGravity();
      for (Planet p : Planet.values())
          System.out.printf("Weight on %s is %f%n",
                            p, p.surfaceWeight(mass));
      }
}
```
Note that Planet, like all enums, 
has a static values method that returns an array of its values in the order they were declared.


### Annotation

Always annotate your functional interfaces with the @FunctionalInterface annotation.

In summary, now that Java has lambdas, it is imperative that you design your APIs with lambdas in mind. 
Accept functional interface types on input and return them on output. 
It is generally best to use the standard interfaces provided in java.util.function, 
but keep your eyes open for the relatively rare cases where you would be better off writing your own functional interface.


### stream

As a rule, even moderately complex tasks are best accomplished using some combination of streams and iteration, 
as illustrated by the Anagrams programs above. 
So refactor existing code to use streams and use them in new code only where it makes sense to do so.


The most important part of the streams paradigm is to structure your computation as a sequence of transformations where the result of each stage is as close as possible to a pure function of the result of the previous stage.

The forEach operation should be used only to report the result of a stream computation, not to perform the computation.

generate a map from alphabetized word to a list of the words sharing the alphabetization

Collection or an appropriate subtype is generally the best return type for a public, sequence-returning method.

you need implement only two methods beyond(mynote: for english learning) the one required for Iterable

#### collection/arraylist class hierachy
Collection
    |
   List
    |
AbstractList
    |
   ArrayList


#### PowerSet && SubLists implement demo

As a rule, performance gains from parallelism are best on streams over ArrayList, HashMap, HashSet, and ConcurrentHashMap instances; arrays;
 int ranges; and long ranges. 



## Method common to all object

The easiest way to avoid problems is not to override the equals method, 
in which case each instance of the class is equal only to itself. 


To paraphrase John Donne, no class is an island.(note for english learning)


This is necessary to ensure that an instance of the subclass is usable anywhere that an instance of the superclass is usable (the Liskov substitution principle)
The Liskov substitution principle says that any important property of a type should also hold for all its subtypes so that any method written for the type should work equally well on its subtypes [Liskov87].


There is no way to extend an instantiable class and add a value component while preserving the equals contract, 
unless you’re willing to forgo the benefits of object-oriented abstraction.

### equal

```java
// Broken - violates transitivity!
@Override public boolean equals(Object o) {
    if (!(o instanceof Point))
        return false;

    // If o is a normal Point, do a color-blind comparison
    if (!(o instanceof ColorPoint))
        return o.equals(this);

    // o is a ColorPoint; do a full comparison
    return super.equals(o) && ((ColorPoint) o).color == color;
}
```
This approach does provide symmetry, but at the expense of transitivity:

```java
ColorPoint p1 = new ColorPoint(1, 2, Color.RED);
Point p2 = new Point(1, 2);
ColorPoint p3 = new ColorPoint(1, 2, Color.BLUE);
```

Now p1.equals(p2) and p2.equals(p3) return true, 
while p1.equals(p3) returns false, a clear violation of transitivity.
The first two comparisons are “color-blind,” while the third takes color into account.

Also, this approach can cause infinite recursion: 
Suppose there are two subclasses of Point, say ColorPoint and SmellPoint, each with this sort of equals method. 
Then a call to myColorPoint.equals(mySmellPoint) will throw a StackOverflowError.

## hashcode
In summary, you must override hashCode every time you override equals, or your program will not run correctly.
