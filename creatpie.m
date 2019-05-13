function creatpie(pospie,Rpie,Hpie)

[a,zpie]=ndgrid((0:.01:1)*2*pi,0:.05*Hpie:Hpie);
xpie=Rpie*cos(a);
ypie=Rpie*sin(a);

xpie = xpie+pospie(1);
ypie = ypie+pospie(2);
zpie = zpie+pospie(3);
%% blue
surf(xpie,ypie,zpie-Hpie,xpie*0,'FaceColor',[0 0 1],'LineStyle','none')
hold on
[a,rpie]=ndgrid((0:.01:1)*2*pi,[0 Rpie]);
xpie1=cos(a).*rpie;
ypie1=sin(a).*rpie;
surf(xpie1,ypie1,xpie1*0-Hpie+pospie(3),xpie1*0,'FaceColor',[0 0 1],'LineStyle','none')
surf(xpie1,ypie1,xpie1*0+pospie(3),xpie1*0,'FaceColor',[0 0 1],'LineStyle','none')
hold on

%% red
surf(xpie,ypie,zpie,xpie*0,'FaceColor',[1 0 0],'LineStyle','none')
surf(xpie1,ypie1,xpie1*0+pospie(3),xpie1*0,'FaceColor',[1 0 0],'LineStyle','none')
surf(xpie1,ypie1,xpie1*0+Hpie+pospie(3),xpie1*0,'FaceColor',[1 0 0],'LineStyle','none')
hold on
end