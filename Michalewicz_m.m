% Michalewicz's Function
% Range of initial points: 0 < xj < pi , j=1,2,...,n
% For n=1:
% Global minima: x=2.20290552017261
% f(x)=-0.801303410098552549 (determined by Maple 2015)
% For n=2:
% Global minima: (x1,x2)=(2.20290552014618,1.57079632677565)
% f(x1,x2)=-1.80130341009855321 (determined by Maple 2015)
% Coded by: Ali R. Alroomi | Last Update: 22 June 2015 | www.al-roomi.org     
graphics_toolkit fltk  
clear
clc
warning off
    
m=10;
 
x1min=0;
x1max=pi;
x2min=0;
x2max=pi;
R=100; % steps resolution
x1=x1min:(x1max-x1min)/R:x1max;
x2=x2min:(x2max-x2min)/R:x2max;
fmin = 10000000;    
minj=0;
mini=0;
for j=1:length(x1)
        
    % For 1-dimensional plotting
    f1(j)=-sin(x1(j))*(sin(1*x1(j).^2/pi)).^(2*m);
    
    % For 2-dimensional plotting
    for i=1:length(x2)            
        f(i)=-sin(x1(j))*(sin(1*x1(j).^2/pi)).^(2*m)-sin(x2(i))*(sin(2*x2(i).^2/pi)).^(2*m);
        if f(i) < fmin,
          minj = j;
          mini = i;
          fmin=f(i);
          #disp(num2str(f(i)));
        end
    end
        
    fn_tot(j,:)=f;
 
end
#disp("X1:")
#disp(x1)
#disp("X2:")
#disp(x2)
#disp(num2str(minj));
#disp(num2str(mini));
 
figure(1)
plot(x1,f1);set(gca,'FontSize',12);
xlabel('x','FontName','Times','FontSize',20,'FontAngle','italic');
ylabel('f(x)','FontName','Times','FontSize',20,'FontAngle','italic');
title('2D View','FontName','Times','FontSize',24,'FontWeight','bold');
 
figure(2)
meshc(x1,x2,fn_tot);colorbar;set(gca,'FontSize',20);
hx = xlabel('x_2','FontName','Times','FontSize',32,'FontAngle','italic');
set (hx,'position',[0,-2,-2.0]); 
set(get(gca,'xlabel'),'rotation',25,'VerticalAlignment','bottom');
hy = ylabel('x_1','FontName','Times','FontSize',32,'FontAngle','italic');
set (hy,'position',[0,2,-2.85]); 

set(get(gca,'ylabel'),'rotation',-25,'VerticalAlignment','bottom');
zlabel('f(X)','FontName','Times','FontSize',25,'FontAngle','italic');
title('3D View','FontName','Times','FontSize',32,'FontWeight','bold');
 
figure(3)
mesh(x1,x2,fn_tot);view(0,90);colorbar;set(gca,'FontSize',12);
xlabel('x_2','FontName','Times','FontSize',25,'FontAngle','italic');
ylabel('x_1','FontName','Times','FontSize',25,'FontAngle','italic');
zlabel('f(X)','FontName','Times','FontSize',25,'FontAngle','italic');
title('X-Y Plane View','FontName','Times','FontSize',25,'FontWeight','bold');
 
figure(4)
mesh(x1,x2,fn_tot);view(90,0);colorbar;set(gca,'FontSize',12);
xlabel('x_2','FontName','Times','FontSize',20,'FontAngle','italic');
ylabel('x_1','FontName','Times','FontSize',20,'FontAngle','italic');
zlabel('f(X)','FontName','Times','FontSize',20,'FontAngle','italic');
title('X-Z Plane View','FontName','Times','FontSize',24,'FontWeight','bold');
 
figure(5)
mesh(x1,x2,fn_tot);view(0,0);colorbar;set(gca,'FontSize',12);
xlabel('x_2','FontName','Times','FontSize',20,'FontAngle','italic');
ylabel('x_1','FontName','Times','FontSize',20,'FontAngle','italic');
zlabel('f(X)','FontName','Times','FontSize',20,'FontAngle','italic');
title('Y-Z Plane View','FontName','Times','FontSize',24,'FontWeight','bold');