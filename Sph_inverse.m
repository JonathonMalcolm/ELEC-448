function Sph_inverse( T, v1_lims, v2_lims, d3_lims )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d2 = 2;

v1(1) = 2*atan2d(-T(1,4) + sqrt(T(1,4)^2 + T(2,4)^2 - d2^2) , d2 + T(2,4));
v1(2) = 2*atan2d(-T(1,4) - sqrt(T(1,4)^2 + T(2,4)^2 - d2^2) , d2 + T(2,4));
check = zeros(1,2);
v2 = zeros(1,2);

for i = 1:2
    check(i) = 0;
    if(v1(i) > v1_lims(1) && v1(i) < v1_lims(2)) % inside limits
        d3 = sqrt((T(1,4)*cosd(v1(i)) + T(2,4)*sind(v1(i)))^2 + T(3,4)^2);
        if(d3 ~= 0) % inside limits
            v2(i) = atan2d(T(1,4)*cosd(v1(i)) + T(2,4)*sind(v1(i)), T(3,4));
            if(v2(i) < v2_lims(1) || v2(i) > v2_lims(2)) % outside limits
                check(i) = 1;
            end
        elseif(d3 < d3_lims(1) || d3 > d3_lims(2)) % outside limits
            check(i) = 1;
        else
            printf('There are infinite solutions and v2 can not be uniquely determined');
        end
    else
        check(i) = 1;
    end
end

if(check(1) == 1 && check(2) == 1) % no solutions
    error('Solution does not exist, it is not possible for the robot to reach the given endpoint');
else
    if(check(2) == 0) % only x(1)
        fprintf('One solution is: v1 = %f, v2 = %f, d3 = %f\n',v1(2),v2(2),d3);
    end
    if(check(1) == 0) % only x(1)
        fprintf('One solution is: v1 = %f, v2 = %f, d3 = %f\n',v1(1),v2(1),d3);
    end
end



end

