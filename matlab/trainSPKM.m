function [U, c] = trainSPKM(X,Y,P,gamma)

% Wrapper for calling the python code for SPKM to train a model

Y = Y*2-1;
out = py.wrapper.runSPKM(py.numpy.array(X),py.numpy.array(Y),P,gamma);
U = double(out{1});
c = double(out{2});