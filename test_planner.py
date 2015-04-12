#!/usr/bin/env python
# Four spaces as indentation [no tabs]

import unittest
from common import *
from planner import *

PLANS = [
  # pb1
  ["cross"],
  # pb2
  ["pick", "lay"],
  # pb3
  ["cross", "pick", "lay", "cross"],
  # pb4
  ["pick", "lay", "cross", "cross", "pick", "lay", "cross", "cross", "pick", "lay", "cross"]
]

# ==========================================
# Test Planner
# ==========================================

class Test_Planner(unittest.TestCase):

    # ------------------------------------------
    # Common tests
    # ------------------------------------------

    def solvable(self, index):
        planner = Planner()
        domain = os.path.join(PATH, "pddl", "planks.pddl")
        problem = os.path.join(PATH, "pddl", "pb" + str(index) + ".pddl")
        planner.solve(domain, problem)
        self.assertIsNotNone(planner.plan)

    def step_optimal(self, index):
        planner = Planner()
        domain = os.path.join(PATH, "pddl", "planks.pddl")
        problem = os.path.join(PATH, "pddl", "pb" + str(index) + ".pddl")
        planner.solve(domain, problem)
        self.assertIsNotNone(planner.plan)
        self.assertEqual(len(planner.plan), len(PLANS[index-1]))

    def plan_match(self, index):
        planner = Planner()
        domain = os.path.join(PATH, "pddl", "planks.pddl")
        problem = os.path.join(PATH, "pddl", "pb" + str(index) + ".pddl")
        planner.solve(domain, problem)
        self.assertIsNotNone(planner.plan)
        self.assertEqual(len(planner.plan), len(PLANS[index-1]))
        for i in range(len(planner.plan)):
            self.assertEqual(planner.plan[i][0], PLANS[index-1][i])

    # ------------------------------------------
    # Problem 1
    # ------------------------------------------

    def test_pb1_solvable(self):
        self.solvable(1)

    def test_pb1_step_optimal(self):
        self.step_optimal(1)

    def test_pb1_plan_match(self):
        self.plan_match(1)

    # ------------------------------------------
    # Problem 2
    # ------------------------------------------

    def test_pb2_solvable(self):
        self.solvable(2)

    def test_pb2_step_optimal(self):
        self.step_optimal(2)

    def test_pb2_plan_match(self):
        self.plan_match(2)

    # ------------------------------------------
    # Problem 3
    # ------------------------------------------

    def test_pb3_solvable(self):
        self.solvable(3)

    def test_pb3_step_optimal(self):
        self.step_optimal(3)

    def test_pb3_plan_match(self):
        self.plan_match(3)

    # ------------------------------------------
    # Problem 4
    # ------------------------------------------

    def test_pb4_solvable(self):
        self.solvable(4)

    def test_pb4_step_optimal(self):
        self.step_optimal(4)

    def test_pb4_plan_match(self):
        self.plan_match(4)

if __name__ == '__main__':
    unittest.main()