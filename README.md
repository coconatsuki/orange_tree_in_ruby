# Orange Tree in Ruby

This is a tamagochi like interactive application that can be used on command line.

This project was inspired by an exercise found in the book 'Learn to Program' from Chris Pine, which is available for free online :
https://pine.fm/LearnToProgram/chap_09.html

It was meant to practice classes, instance variables and the initialize function in ruby language.

The example given in the book was a 'Dragon Tamagochi' that the user could feed, walk or put to bed.
I got really inspired by it, and got carried away and went beyond the instructions to make something more complex and enjoyable.

The basic instructions were :

Make an OrangeTree class.

It should have a height method which returns its height, and a oneYearPasses method, which, when called, ages the tree one year. Each year the tree grows taller, and after some number of years, the tree should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than younger trees... And, of course, you should be able to countTheOranges , and pickAnOrange (which reduces the @orangeCount by one and returns a string telling you how delicious the orange was, or else it just tells you that there are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year.

To that instructions, I added : the possibility to give it a name, the compost function to feed the tree (and to rise the oranges production), and also the possibility to get sick if too much watered, or die if not watered enough.

I also added a 'menu' with the instructions, so that the user can really have an interaction with the tree, like a real game.

Unfortunately, all the texts are in french. At that time, It was my first back-end application, and I was really excited, so I wanted to show it to my family (some don't understand english).
But now, I regret a bit. ^^;

Anyway, it was a very enjoyable first back-end project !
