function meanSquaredError = meanSquaredError(Original, Calculated)
% MEANSQUAREDERROR Returns the Mean Squared Error (MSE) between Original
% and Calculated

meanSquaredError = sum(sum((Original - Calculated).^2 ));

end
