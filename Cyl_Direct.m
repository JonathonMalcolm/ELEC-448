function [ T ] = Cyl_Direct( v1, d2, d3 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    T = zeros(4,4);
    T(1,1) = cosd(v1);
    T(2,1) = sind(v1);
    T(3,2) = -1;
    T(1,3) = -sind(v1);
    T(2,3) = cosd(v1);
    T(1,4) = -d3*sind(v1);
    T(2,4) = d3*cosd(v1);
    T(3,4) = d2;
    T(4,4) = 1;
end

