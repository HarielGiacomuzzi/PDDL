#!/usr/bin/env python
# Four spaces as indentation [no tabs]

from common import *
import subprocess

class Planner:

    # ------------------------------------------
    # Initialize
    # ------------------------------------------

    def __init__(self):
        self.plan = None

    # ------------------------------------------
    # Solve
    # ------------------------------------------

    def solve(self, domain_filename, problem_filename):
        # Stores last plan
        self.plan = None
        # External planner
        args = ["java","-jar","javagp-bin-1.0/javagp.jar","-d",domain_filename,"-p",problem_filename]
        proc = subprocess.Popen(args,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
        plan_found = False
        for line in proc.stdout:
            line = line.strip()
            if "Plan found:" in line:
                self.plan = []
                plan_found = True
            elif plan_found:
                if not line:
                    break
                self.plan.append(re.findall(r'\w+',line))

# ==========================================
# Main
# ==========================================
if __name__ == "__main__":
    planner = Planner()
    domain = os.path.join(PATH, "pddl", "planks.pddl")
    for i in range(4):
        print "Problem " + str(i+1)
        problem = os.path.join(PATH, "pddl", "pb" + str(i+1) + ".pddl")
        planner.solve(domain, problem)
        pprint.pprint(planner.plan, None, 4)