x = (10*-pi:0.1:10*pi)';
y = sin(x);
fig = figure;
hold on
plot(x,y,'*')

Obj = VideoWriter('out.avi');
Obj.FrameRate = 60;
open(Obj);

for i = 1:size(y)
    pause(0.1);
    figure(fig);
    plot(x(i),y(i),'or');
    
    frame = getframe(gcf);
    writeVideo(Obj, frame);
end


close(Obj);