function Rot2UQuater( RotMatrix )
%Rot2UQuater converts a rotation matrix into the Unit Quaternions
%   This function takes in a 3x3 rotation matrix and calculates the
%   Euler parameters (Eta and Esp).

Eta = sqrt(RotMatrix(1,1) + RotMatrix(2,2) + RotMatrix(3,3) + 1)/2;
e = [sign(RotMatrix(3,2) - RotMatrix(2,3))*sqrt(RotMatrix(1,1) + RotMatrix(2,2) + RotMatrix(3,3) + 1);
    sign(RotMatrix(1,3) - RotMatrix(3,1))*sqrt(RotMatrix(2,2) + RotMatrix(3,3) + RotMatrix(1,1) + 1);
    sign(RotMatrix(3,2) - RotMatrix(2,3))*sqrt(RotMatrix(3,3) + RotMatrix(1,1) + RotMatrix(2,2) + 1)];
Esp = e ./ 2;

fprintf('Eta = %0.2f \nEsp = (%0.2f, %0.2f, %0.2f)\n\n', Eta, Esp(1), Esp(2), Esp(3));

end

