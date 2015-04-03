% Based on code from https://github.com/newmanne/ece521/blob/2563ca16003136863eb15b1882c17bffc58dd374/Inference1/meanSquaredError.m
function [ meanSquaredError ] = meanSquaredError(YPrediction, YMeasured)
%     meanSquaredError = sum((YPrediction - YMeasured).^2) ./ length(YPrediction);
meanSquaredError = mean(mean((YPrediction - YMeasured).^2));
end
