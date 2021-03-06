# mdp
=========

A command-line based markdown presentation tool.

_Basic controls:_

next slide      *Enter*, *Space*, *Right Arrow*

previous slide  *Backspace*, *Left Arrow*

quit            *q*
reload          *r*
slide N         *1..9*
first slide     *Home*, *g*
last slide      *End*, *G*

* There are fading problems on *iTerm2*, to see next slides
	*hit enter* and then *r*, then everything works.


## How to write your own presentations?
=======

It's simple.
1. Write your presentation in markdown.
   Remember if you don't want problems
   *One slide can have maximum 24 lines*

2. Put your presentations into docker container
   How? You have two options they're presentend on next slides


## Method 1 - New autoplay container
======

* Create new directory for your presentation files
* In new directory create new `Dockerfile` 

```
FROM piotron/mdp-onbuild
	LABEL author="<yourname>"
	LABEL presentation_title="<your title>"
```

* Then create presentation.mdp file with you presentation

Build everything with

```
docker build -t <yourtag> .
```

## Method 2 - Copy presentation to exising container
======

This method is very helpful when you are preparing presentation 
and you want to check if everything is ok.

Run your container for first time. For example
```
docker run -ti piotron/mdp
```

Check name of your container(if you didn't set it)
```
docker ps -a
```

and look for the latest container from *piotron/mdp*

-------------------------------------------------------------------------------

## Method 3 - Mount volumen(physical directory) into container
======

Use this method if you have directory of presentations.
```
docker run --rm -ti -v $(pwd)/presentations:/presentations piotron/mdp <file>
```

-------------------------------------------------------------------------------

## Hints 

You can invert colors with `-i presentation.mdp` param

