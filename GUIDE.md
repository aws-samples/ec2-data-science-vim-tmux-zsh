### Practical guidance on Vim
Vim makes navigation through code seamless. With practice, you will be able to
type and initiate code quickly. If you have never used Vim before, check out
vimtutor, which provides the most basic navigation commands. Here we focus on a
few useful Vim commands that will be helpful for those in the early days of
learning to use the tool.

**Navigating enclosures**

Quick and effective code editing often comes down to manipulating text within
of enclosures (for example, ", (, [, {,). Core commands consist of three
components:

What you want to do to the text (for example, change, yank, delete).  Whether
you want to include the enclosure or merely the text inside of it (i for
inside, a for around).  Which enclosure you want to include (for example ", (,
[, {,).  Put these commands together when inside an enclosure, and you have a
powerful tool for editing code. To illustrate, here are a few examples:

* ci) — change everything inside the parentheses.  yi“ — yank everything inside
* the quotation marks. This is akin to copy and pasting the text within the
* quotations marks.  da] — delete everything within the square brackets,
* including all the brackets.

As always, once a command has been initiated, the command will be temporarily
saved and can be repeated with the . command, until it is overwritten by the
execution of another command.

![img](gifs/navigating-enclosures-low.mp4)
