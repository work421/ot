clear all
clc

C = [2 3 4 7];
A = [2, 3, -1, 4; 1, -2, 6, -7];
B = [8; -3];

m = size(A, 1);
n = size(A, 2);

s_no = nchoosek(n, m);
t = nchoosek(1:n, m);

sol = [];
if n > m
    for i = 1:s_no
        y = zeros(n,1);
        X = A(:, t(i, :))\B;
        if all(X >= 0 & X ~= inf)
            y(t(i, :)) = X;
            sol = [sol y]
        end
    end
else
    error('Eq are larger than variables')
end

Z = C*sol
[Zmax, Zindex] = max(Z)
BFS = sol(:, Zindex)
