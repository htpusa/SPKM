function Ypred = trainPredictSPKM(Xtrain,Ytrain,P,gamma,Xtest)

% Wrapper for calling the python code for SPKM to train and then predict

    if size(Xtrain,2)<2
        Ypred = rand(size(Xtest,1),1)<sum(Ytrain)/numel(Ytrain);
    else
        [U,c] = trainSPKM(Xtrain,Ytrain,P,gamma);
        Ypred = predictSPKM(Xtest,U,c);
    end