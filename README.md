# Planning Assignment
:squirrel: **Planning domain specification assignment**

In this assignment you will have to describe the initial and goal state as problems, and the actions as the domain.
Once described a planner can do the hard work for you, that is, find the plan.
In order to do so, you have to describe all the elements of the environment as propositions and actions with preconditions and effects in PDDL, the standard planning language for deterministic scenarios.
PDDL is a language with Lisp syntax and independent definition, and some planners may not support all the features you need or wish to use, so be careful.
The planner acts as a centralized problem solver, which means that all actions will be taken to solve the problem, and all agents cooperate.

## Story

The environment consists of an archipelago in which agents must use improvised bridges made of planks to move between the islands.
Therefore 3 types of objects exist:

- Agents
- Islands
- Planks

The agents may **cross** a bridge to reach an adjacent island; **pick** up; and **lay** down planks to create new bridges.
This would be an easy problem if our agents were super-strong with good planks all over the place.
This is not the case, our agents are not strong enough to **pick** more than one plank at a time, but once holding the plank no other agent would steal them.
The islands are not big enough to safely contain more than one agent, and they do not know how to swim.
Planks are short and can only connect adjacent islands. 
Moreover, the scarcity of planks requires agents to destroy and create new bridges as they **pick** and **lay** a plank in a different place.
At least these planks are made of good wood and can be reused an infinite number of times.

The islands are distributed along a matrix, take advantage of the position to name yours using a scheme such as ```island(px0y0)```.

## Execution

The first step is to find a planner.
JavaGP is one such planner capable to interpret PDDL and solve the problems in a reasonable amount of time, you can [download it here](http://sourceforge.net/projects/emplan/), but we already copied JavaGP into the project folder.
Once you finished your domain and problem description, you can execute the planner. JavaGP has several parameters, but the minimum is the domain and problem file (which we recommended to be in the PDDL folder to match examples and scripts):

```
cd this_repo_folder
java -jar javagp-bin-1.0/javagp.jar -d pddl/planks.pddl -p pddl/pb1.pddl
```

If you wish to run several problem files at once we already wrapped JavaGP in a neat Python script:

```
python -B planner.py
```

If you wish to use our automated tests to compare plans (only actions names, you are free to decide your predicates and objects):

```
python -B test_planner.py
```

## Zip

Please use our zipper to submit your PDDL files, the script saves our time to check if your solution is correct.
Zipper will ask for your student ID, like 09123456, and zip the pddl folder to s<Student_ID>.zip:

```
python -B zipper.py
```

You should see something like this:

```bash
>python -B zipper.py
Student ID (like 09123456): s09123789
  adding: pddl/ (152 bytes security) (stored 0%)
  adding: pddl/pb1.pddl (152 bytes security) (deflated 54%)
  adding: pddl/planks.pddl (152 bytes security) (deflated 56%)
```
