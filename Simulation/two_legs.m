%Declare variables
clear all

crank_r_b = 26;
link_1_b = 153.41;
link_2_b = 56;
link_3_b = 77;
link_4_b = 73.55;

%avi = moviein((8*pi+pi/2)*5);
i=0;
%Animation
figure(1)

%hind leg
crank_x_b = -60;
crank_y_b = 0;

pin_x_b = crank_x_b - 52.90;
pin_y_b = crank_y_b - 4.50;

x_1_b = [];
y_1_b = [];

x_2_b = [];
y_2_b = [];

x_3_b = [];
y_3_b = [];

x_4_b = [];
y_4_b = [];

c_x_b = [];
c_y_b = [];

%fore leg
crank_x = 60;
crank_y = 0;

pin_x = crank_x + 52.90;
pin_y = crank_y - 4.50;

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


for t=0:0.1:3*pi;
    
    i=i+1;
    
    %hind leg
    crank_x_b = crank_r_b*cos(t);
    crank_y_b = -crank_r_b*sin(t);
    
    [node_1_x_b, node_1_y_b] = node_1(crank_x_b, crank_y_b, pin_x_b, pin_y_b, link_2_b, (link_1_b)/2, 1);
    
    [node_2_x_b, node_2_y_b] = node_1(crank_x_b, crank_y_b, pin_x_b, pin_y_b, link_2_b, link_3_b, 2);
    
    node_3_x_b = 2*pin_x_b - node_1_x_b;
    node_3_y_b = 2*pin_y_b - node_1_y_b;
    
    [node_4_x_b, node_4_y_b] = node_1(node_2_x_b, node_2_y_b, node_3_x_b, node_3_y_b, link_4_b, link_4_b, 2);
    
    x_1_b(end+1) = node_1_x_b;
    y_1_b(end+1) = node_1_y_b;
    
    x_2_b(end+1) = node_2_x_b;
    y_2_b(end+1) = node_2_y_b;
    
    x_3_b(end+1) = node_3_x_b;
    y_3_b(end+1) = node_3_y_b;
    
    x_4_b(end+1) = node_4_x_b;
    y_4_b(end+1) = node_4_y_b;
    
    c_x_b(end+1) = crank_x_b;
    c_y_b(end+1) = crank_y_b;
    
    
    %fore leg
    crank_x = crank_r*sin(t);
    crank_y = -crank_r*cos(t);
    
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
   
    
    %plotting
    %plot([crank_x 0], [crank_y 0],'k','linewidth',4); hold on; 
    plot([crank_x_b node_1_x_b], [crank_y_b node_1_y_b],'k','linewidth',2.5); hold on; 
    plot([crank_x_b node_2_x_b], [crank_y_b node_2_y_b],'k','linewidth',2.5); hold on;
    plot([node_1_x_b node_3_x_b], [node_1_y_b node_3_y_b],'g','linewidth',2.5); hold on; 
    plot([node_4_x_b node_2_x_b], [node_4_y_b node_2_y_b],'r','linewidth',2.5); hold on;
    plot([node_4_x_b node_3_x_b], [node_4_y_b node_3_y_b],'r','linewidth',2.5); hold on;
    plot([pin_x_b node_2_x_b], [pin_y_b node_2_y_b],'y','linewidth',2.5); 
    plot(x_1_b,y_1_b,'b');
    plot(x_2_b,y_2_b,'b');
    plot(x_3_b,y_3_b,'b');
    plot(x_4_b,y_4_b,'b');
    plot(c_x_b,c_y_b,'b');
    
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
    
    xlim([-300 300]);
    ylim([-150 100]);
    axis equal;
    hold off;
    
    pause(0.001);
    %avi(i) = getframe(gca);
end