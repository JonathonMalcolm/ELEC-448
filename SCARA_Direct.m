function [ T ] = SCARA_Direct( v1, v2, d3, v4 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    T = zeros(4,4);
    a1 = 1;
    a2 = 1;
    
    T(1,1) = cosd(v1)*cosd(v2)*cosd(v4);
    T(2,1) = sind(v1)*sind(v2)*sind(v4);
    T(1,2) = -sind(v1)*sind(v2)*sind(v4);
    T(2,2) = cosd(v1)*cosd(v2)*cosd(v4);
    T(3,3) = 1;
    T(1,4) = a1*cosd(v1) + a2*cosd(v1)*cosd(v2);
    T(2,4) = a1*sind(v1) + a2*sind(v1)*sind(v2);
    T(3,4) = d3;
    T(4,4) = 1;
end

