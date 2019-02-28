import math
from collections import OrderedDict


class OnlineAvVar(object):
  '''A class that uses an online algorithm to compute mean and variance.'''

  def __init__(self, store_data = False):
    self.step = 0
    self.mean = 0.0
    self.M2 = 0.0

    self.store = store_data
    self.data = []


  def accumulate(self, x):
    '''Accumulate data points to compute mean and variance on-the-fly.'''

    self.step += 1

    delta = x - self.mean

    self.mean += delta / self.step
    self.M2 += delta * (x - self.mean)

    if self.store:
      self.data.append(x)


  def get_variance(self):
    '''Convenience funtion to return variance.'''

    return self.M2 / (self.step - 1)


  def get_stat(self):
    '''Convenience funtion to return mean and standard deviation.'''

    return self.mean, math.sqrt(self.M2 / (self.step - 1))

if __name__ == '__main__':
  import os, sys, glob
  import numpy as np

  prog = sys.argv[0]

  if len(sys.argv) < 4:
    print >>sys.stderr, 'Usage: %s skip glob_pattern windows' % prog
    sys.exit(1)

  skip = 5 # hard-coded - used to be passed on command line as int(sys.argv[1])
#  glob_pattern = sys.argv[2] # don't use glob_pattern
  output_filename = sys.argv[1]
  windows = sys.argv[2:]   # follows '--'
  extrap = 'polyfit' # or linear or polyfit
  stats = []

  data = OrderedDict()

  fout = open(output_filename,'w')
  for window in windows:
    cwd = os.getcwd()
#    os.chdir(os.path.dirname(os.path.realpath(window)))
###    print >>fout, 'window = %s' % window
    dVdl = OnlineAvVar()    
    ln = 0

    for en in [ window ]: # used to be glob.glob(glob_pattern):
###      print >>fout, 'en  %s' % en
      with open(en, 'r') as en_file:
        for line in en_file:
          ln += 1
          if ln > skip and line.startswith('L9') and not 'dV/dlambda' in line:
             val = line.split()[5]
###             print >>fout, 'ln = %d | val = %s' % (ln, val)
             dVdl.accumulate(float(val))

    mean, std = dVdl.get_stat()
    window_dir = os.path.dirname(os.path.realpath(window))
    window_name = window_dir[window_dir.rfind('/')+1:]
###    print >>fout, 'dVdl.step = %f' % dVdl.step
    data[float(window_name)] = (mean, std / math.sqrt(dVdl.step), std)

#    os.chdir(cwd)

  x = data.keys()
  y = [d[0] for d in data.values()]

  if extrap == 'linear':
    if 0.0 not in x:
      l = (x[0]*y[1] - x[1]*y[0]) / (x[0] - x[1])
      x.insert(0, 0.0)
      y.insert(0, l)

    if 1.0 not in x:
      l = ( (x[-2] - 1.0)*y[-1] + ((1.0-x[-1])*y[-2]) ) / (x[-2] - x[-1])
      x.append(1.0)
      y.append(l)
  elif extrap == 'polyfit' and (0.0 not in x or 1.0 not in x):
    if len(x) < 6:
      deg = len(x) - 1
    else:
      deg = 6

    coeffs = np.polyfit(x, y, deg)

    if 0.0 not in x:
      x.insert(0, 0.0)
      y.insert(0, coeffs[-1])

    if 1.0 not in x:
      x.append(1.0)
      y.append(sum(coeffs) )

  fout = open(output_filename,'w')
  print >>fout, '(( :lambdas ('
  for a, b in zip(x, y):
    if a in data:
      v = data[a]
      print >>fout, '( ', a, v[0], v[1], v[2], ') '
    else:
      print >> fout, ';;; ', a, b
  print >>fout, '))'
  print >>fout, '( :dg . ', np.trapz(y, x), '))'
  fout.close()

