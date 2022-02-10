function Y = predictSPKM(X,U,c)

% Wrapper for calling the python code for SPKM to predict based on given
% model (U and c)

    out = py.wrapper.predictSPKM(py.numpy.array(X),py.numpy.array(U),...
            py.numpy.array(c));
    Y = double(out)';
    Y = Y==1;