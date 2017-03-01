function SCARA_Inverse(T, v1_lims, v2_lims, d3_lims, v4_lims )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    a1 = 1;
    a2 = 1;

    c2 = (T(1,4)^2 + T(2,4)^2 - a1^2 - a2^2)/(2*a1*a2);
    s2(1) = sqrt(1-c2^2);
    s2(2) = -sqrt(1-c2^2);
    phi = acosd(T(1,1));
    d3 = T(3,4);
    
    for i = 1:2
    v2(i) = atan2d(s2(i),c2);    
    v1(i) = atan2d(((a1+a2*c2)*T(2,4)-a2*s2(i)*T(1,4))/(T(1,4)^2 + T(2,4)^2), ((a1+a2*c2)*T(1,4)+a2*s2(i)*T(2,4))/(T(1,4)^2 + T(2,4)^2));
    v4(i) = phi - v1(i) - v2(i);  
    end
    
    fprintf('v1 = %f, v2 = %f, d3 = %f, v4 = %f\n',v1(1),v2(1),d3,v4(1));

end

