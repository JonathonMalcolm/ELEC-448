function Rot2ZYZ( RotMatrix )
%Rot2ZYZ converts a rotation matrix into the ZYZ Euler Angles
%   This function takes in a 3x3 rotation matrix and calculates the ZYZ
%   Euler Angles while also checking for special cases where Phi and Psi
%   can not be found.

if (RotMatrix(1,3) == 0 && RotMatrix(2,3) == 0 && RotMatrix(3,1) == 0 && RotMatrix(3,2) == 0)
    if (RotMatrix(3,3) == 1) 
        fprintf('Nu = 0 therefore Psi and Phi cannot be found separately.\n');
        x = (180/pi) * atan2(RotMatrix(2,1), RotMatrix(2,2));
        fprintf('Phi + Psi = %0.2f\n\n', x);
    else
        fprintf('Nu = 180 therefore Psi and Phi cannot be found separately.\n');
        x = (180/pi) * atan2(RotMatrix(2,1), RotMatrix(2,2));
        fprintf('Phi - Psi = %0.2f\n\n', x);
    end
else
    Phi1 = atan2(RotMatrix(2,3),RotMatrix(1,3));
    Nu1 = atan2(sqrt(RotMatrix(1,3)^2+RotMatrix(2,3)^2),RotMatrix(3,3));
    Psi1 = atan2(RotMatrix(3,2),-RotMatrix(3,1));
    fprintf('Assuming 0 < Nu < 180 \nPhi = %0.2f degrees \nNu = %0.2f degrees \nPsi = %0.2f degrees\n\n',Phi1, Nu1, Psi1);
   
    Phi2 = atan2(-RotMatrix(2,3),-RotMatrix(1,3));
    Nu2 = atan2(-sqrt(RotMatrix(1,3)^2+RotMatrix(2,3)^2),RotMatrix(3,3));
    Psi2 = atan2(-RotMatrix(3,2),RotMatrix(3,1));
    fprintf('Assuming -180 < Nu < 0 \nPhi = %0.2f degrees \nNu = %0.2f degrees \nPsi = %0.2f degrees\n\n',Phi2, Nu2, Psi2);
end

end

