%Declare variables
clear all

crank_r = 26;
link_1 = 153.41;
link_2 = 56;
link_3 = 77;
link_4 = 73.55;

crank_x = 0;
crank_y = 0;

pin_x = crank_x + 52.90;
pin_y = crank_y - 4.50;

avi = moviein((8*pi+pi/2)*5);
i=0;
%Animation
figure(1)

x_1 = [];
y_1 = [];

x_2 = [];
y_2 = [];

x_3 = [];
y_3 = [];

x_4 = [];
y_4 = [];

c_x = [];
c_y = [];

for t=0:0.1:2*pi+pi/2;
    
    i=i+1;
    crank_x = crank_r*cos(t);
    crank_y = -crank_r*sin(t);
    
    [node_1_x, node_1_y] = node_1(crank_x, crank_y, pin_x, pin_y, link_2, (link_1)/2, 1);
    
    [node_2_x, node_2_y] = node_1(crank_x, crank_y, pin_x, pin_y, link_2, link_3, 2);
    
    node_3_x = 2*pin_x - node_1_x;
    node_3_y = 2*pin_y - node_1_y;
    
    [node_4_x, node_4_y] = node_1(node_2_x, node_2_y, node_3_x, node_3_y, link_4, link_4, 2);
    
    x_1(end+1) = node_1_x;
    y_1(end+1) = node_1_y;
    
    x_2(end+1) = node_2_x;
    y_2(end+1) = node_2_y;
    
    x_3(end+1) = node_3_x;
    y_3(end+1) = node_3_y;
    
    x_4(end+1) = node_4_x;
    y_4(end+1) = node_4_y;
    
    c_x(end+1) = crank_x;
    c_y(end+1) = crank_y;
    
    
    %crank_x
    %crank_y
    
    
    %plot([crank_x 0], [crank_y 0],'k','linewidth',4); hold on; 
    plot([crank_x node_1_x], [crank_y node_1_y],'k','linewidth',2.5); hold on; 
    plot([crank_x node_2_x], [crank_y node_2_y],'k','linewidth',2.5); hold on;
    plot([node_1_x node_3_x], [node_1_y node_3_y],'g','linewidth',2.5); hold on; 
    plot([node_4_x node_2_x], [node_4_y node_2_y],'r','linewidth',2.5); hold on;
    plot([node_4_x node_3_x], [node_4_y node_3_y],'r','linewidth',2.5); hold on;
    plot([pin_x node_2_x], [pin_y node_2_y],'y','linewidth',2.5); 
    plot(x_1,y_1,'b');
    plot(x_2,y_2,'b');
    plot(x_3,y_3,'b');
    plot(x_4,y_4,'b');
    plot(c_x,c_y,'b');
    xlim([-150 50]);
    ylim([-150 100]);
    axis equal;
    hold off;
    
    pause(0.001);
    avi(i) = getframe(gca);
end