function saveFigs( fig, filename, extension)
%SAVEFIGS Saves a figure to a file
%   Wrapper for print function. 
%   Takes in the figure and the desired fileformat, and outputs a file.

print(fig, filename, '-dpng','-r125');
end

