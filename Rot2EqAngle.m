function Rot2EqAngle( RotMatrix )
%Rot2EqAngle converts a rotation matrix into the Equivalent Angle and axis
%   This function takes in a 3x3 rotation matrix and calculates the
%   Equivalent Angle (v) and the axis (r) while also checking for special
%   cases where Phi and Psi can not be found.

Nu = acosd((RotMatrix(1,1) + RotMatrix(2,2) + RotMatrix(3,3) - 1)/2);
if (Nu == 0)
    fprintf('Nu = 0 is a special case so the unit vector R is arbitrary.\n\n');
elseif (Nu == 180)
    fprintf('Nu = 180 is a special case so the unit vector R is arbitrary.\n\n');
else
    r = [RotMatrix(3,2)-RotMatrix(2,3);RotMatrix(1,3)-RotMatrix(3,1);RotMatrix(2,1)-RotMatrix(1,2)];
    R = 1/(2*sind(Nu)).*r;
    fprintf('Nu = %0.2f \nR = (%0.2f, %0.2f, %0.2f)\n\n',Nu,R(1),R(2),R(3));
end

end

