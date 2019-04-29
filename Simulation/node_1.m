function [ x, y ] = node_1( x1,y1,x2,y2,l1,l2,n )

syms x_ y_

eqn2=sqrt((x_-x2)^2+(y_-y2)^2)==l2;
eqn1=sqrt((x_-x1)^2+(y_-y1)^2)==l1;

if n==1
    sol = solve(eqn1, eqn2, y_>=y1, x_, y_);
elseif n==2
    sol = solve(eqn1, eqn2, y_<=y1, x_, y_);
end

x = sol.x_;
y = sol.y_;

end

