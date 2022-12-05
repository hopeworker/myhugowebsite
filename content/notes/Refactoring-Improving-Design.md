## Refactoring - Improving the Design of Existing(By Martin Fowler)
Interfaces are good to use whenever a class has distinct roles in different situations.

When you are untangling an inheritance mess, every mess is different.

Do as much as you need to achieve your real task. You can always come back tomorrow.

So we've compressed the examples into a few sketchy diagrams

The big refactorings require a degree of agreement among the entire programming team that isn't needed with the smaller refactorings.

why are they important enough that we wanted to put them in this book?

No one or two or even ten individual actions will be enough to eradicate the problem

A single method can take on importance out of proportion with its size because of where it sits in the hierarchy.
And the misuse can easily creep up on you.

In many ways, refactoring is like exercise and eating a proper diet. 
Many of us know that we ought to exercise more and eat a more balanced diet. 
Some of us live in cultures that highly encourage these habits. 
Some of us can get by for a while without practicing these good habits, even without visible effects. 
We can always make excuses, but we are only fooling ourselves if we continue to ignore good behavior.

Although refactoring may seem a bit awkward and an overhead item at first, 
as it becomes part of a software development regimen, 
it stops feeling like overhead and starts feeling like an essential.

Maybe you're even a little abashed at how stupid you could have been not to have seen it all along

It's a little like walking along a narrow trail above a one-thousand-foot drop. 
As long as the light holds, you can step forward cautiously but with confidence.

When you really understand refactoring, the design of the system is as fluid and plastic and moldable to you as the individual characters in a source code file. 
Refactoring is a learnable skill, the components of which you have read about in this book and begun to learn about. 
Then you begin to see development in a new light.

In refactoring there is a premium on working carefully and methodically.

Never forget the two hats. When you refactor, you will inevitably discover cases in which the code doesn't work right. 
You'll be absolutely certain of it. 
Resist temptation. 
When you are refactoring, your goal is to leave the code computing exactly the same answers it was when you found it.
Nothing more, nothing less. Keep a list (I always have an index card beside my computer) of things to change later—test cases to add or change, 
unrelated refactorings, documents to write, diagrams to draw. 
That way you won't lose those thoughts, but you won't let them mess up what you are doing now.


