# Planning Assignment
:squirrel: **Planning domain specification assignment**

In this assignment you will have to describe the initial and goal state as problems, and the actions as the domain.
Once described a planner can do the hard work for you, find the plan.
In order to do so, you will have to describe all the elements of the environment as propositions and actions with preconditions and effects in PDDL, the standard planning language for deterministic scenarios.
PDDL is a language with Lisp syntax and independent definition, some planners may not support all the features you need or wish to use, be careful.
The planner acts as a centralized problem solver, which means all action will be taken to solve the problem, all agents cooperate.

## Story

The environment is an archipelago where agents must use improvised bridges made of planks to move between the islands.
Therefore 3 types of objects exist:

- Agents
- Islands
- Planks

The agents may **cross** a bridge to reach an adjacent island, **pick** up and **lay** of planks to create new bridges.
This would be an easy problem if our agents were super-strong with good planks all over the place.
This is not the case, our agents are not strong enough to **pick** more than one plank at a time, but once holding the plank no other agent would steal.
The islands are not big enough to safely contain more than one agent, and they do not know how to swim.
The planks are short, can only connect with adjacent islands.
The lack of planks require agents to destroy and create new bridges as they **pick** and **lay** a plank in a different place.
At least these planks are made of good wood and can be used an infinite amount of times.

The islands are distributed along a matrix, take advantage of the position to name yours, like ```island(px0y0)```.

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

```
C:\Users\Bob\Desktop\planning>python -B zipper.py
Student ID (like 09123456): s09123789
  adding: pddl/ (152 bytes security) (stored 0%)
  adding: pddl/pb1.pddl (152 bytes security) (deflated 54%)
  adding: pddl/planks.pddl (152 bytes security) (deflated 56%)
```
