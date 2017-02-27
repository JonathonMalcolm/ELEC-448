function [ T ] = Sph_Direct( v1, v2, d3 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    T = zeros(4,4);
    d2 = 2; % given
    T(1,1) = cosd(v1)*cosd(v2);
    T(2,1) = sind(v1)*cosd(v2);
    T(3,1) = -sind(v2);
    T(1,2) = -sind(v1);
    T(2,2) = cosd(v1);
    T(1,3) = cosd(v1)*sind(v2);
    T(2,3) = sind(v1)*sind(v2);
    T(3,3) = cosd(v2);
    T(1,4) = cosd(v1)*sind(v2)*d3 - sind(v1)*d2;
    T(2,4) = sind(v1)*sind(v2)*d3 + cosd(v1)*d2;
    T(3,4) = cosd(v2)*d3;
    T(4,4) = 1;
end

