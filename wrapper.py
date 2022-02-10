from kernels_and_gradients import PolyKernel
from losses_and_gradients import CosLoss
from spkm import SPKM
import numpy as np

def runSPKM(X,Y,P,gamma):

    # hack because Y comes in the wrong shape from matlab
    if np.ndim(Y) > 1:
        Y = np.concatenate(Y)

    r = 1
    d = 2
    n_u = 40
    kernel = PolyKernel({"r":r, "d":d})
    spkm = SPKM()
    u, cvec = spkm.train(X, kernel, Y, n_u, P, gamma, classification=True, loss=CosLoss, closs="sq", creg=2,
              init="randn", n_inits=5, rseed=0,
              standardise=False, calculate_new_rbf_param=False, standardise_labels=False,
              max_outer_iters=5, max_gd_iters=50, stepsize=10, verbosity=0)

    return u, cvec

def predictSPKM(X,u,cvec):

    r = 1
    d = 2
    spkm = SPKM()
    spkm.u = u
    spkm.c = cvec
    spkm.kernel = PolyKernel({"r":r, "d":d})
    spkm.standardise_labels = False
    Y = spkm.predict(X)
    Y = np.sign(Y)

    return Y

