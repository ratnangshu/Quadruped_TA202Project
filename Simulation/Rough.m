syms x y x1 x2 y1 y2 l1 l2

eqn2=sqrt((x-x2)^2+(y-y2)^2)==l2;
eqn1=sqrt((x-x1)^2+(y-y1)^2)==l1;
n=2;

if n==1
    sol = solve(eqn1, eqn2, y>=y1, x, y);
elseif n==2
    sol = solve(eqn1, eqn2, y<=y1, x, y);
end

sol.x
sol.y