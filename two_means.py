#!/usr/bin/python
import sys
import os
import copy
from operator import add, sub

def delta(u,v):
  assert(len(u)==len(v))
  l = len(u)
  return reduce(add, map(lambda x: x**(1.0/l), map(abs, map(sub, zip(u,v)))))

def assignement_s(ms, xs):
  S = {x: [] for x in range(len(ms))}
  for x, xi in zip(xs.values(),xs.keys()):
    least = ms[0], 0
    for m, i in zip(ms,range(len(ms))):
      if abs(least[0]-x) >= abs(m-x):
        least = m, i
    S[least[1]].append(xi)
  return S

def update_s(S, xs):
  ms = [0]*len(S)
  for si in S:
    sum = 0
    for xi in S[si]:
      sum += xs[xi]
    if len(S[si]) > 0:
      ms[si] = (sum / float(len(S[si])))
  return ms


if __name__=="__main__":
  if "--help" in sys.argv or "-h" in sys.argv:
    print """usage:
{} DIRECTORY LIST-OF-FILES...
copies largest files after two-means separation by size over to DIRECTORY

author: hacxman <at> gmail d*o*t com""".format(sys.argv[0])
    exit(2)
  dct = {}
  for fname in sys.argv[2:]:
    dct[fname] = os.stat(fname).st_size

  from stat import S_ISDIR
  if not S_ISDIR(os.stat(sys.argv[1]).st_mode):
    print("First argument must be directory")
    exit(1)

  means     = [0,0]
  old_means = [0,1]
  while not means == old_means:
    S = assignement_s(means, dct)
#    print map(lambda i: len(S[i]), S)
    old_means = copy.copy(means)
    means = update_s(S, dct)
    print means

  good_idx = means.index(max(means))
  print "candidates count: {}".format(len(S[good_idx]))
#  exit(0)
  import shutil
  i = 0
  c = len(S[good_idx])
  for f in S[good_idx]:
    shutil.copy2(f, sys.argv[1])
    i += 1
    sys.stdout.write("{} of {}    \r".format(i,c))
  print "\ndone."

