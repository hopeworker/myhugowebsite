

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