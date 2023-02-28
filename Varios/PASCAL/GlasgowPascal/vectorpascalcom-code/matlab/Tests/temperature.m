% This function is named 'temperature.m'.
% It has one input value 'x' and two outputs, 'c' and 'f'.
 
% If 'x' is a Celsius number, output variable 'f'
% contains its equivalent in Fahrenheit degrees.
% If 'x' is a Fahrenheit number, output variable 'c'
% contains its equivalent in Celsius degrees.
 
% Both results are given at once in the output vector [c f]
 
function [c f] = temperature(x)
f = 9*x/5 + 32;
c = (x - 32) * 5/9;
end;

