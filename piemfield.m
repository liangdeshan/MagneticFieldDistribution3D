function [bmx,bmy,bmz,bmnorm] = piemfield(pos,Rpie,x,y,z)


% magnetic field distribution
% pos of magnet
% x y z is spatial
% bmx bmy bmz is mfield distribution
% bmnorm is mfield strength
%%  split
theta = linspace(0,2*pi,6);
Rpie = Rpie*0.7;

posx = Rpie*cos(theta)+pos(1);
posy = Rpie*sin(theta)+pos(2);
posz = posx*0+pos(3);

splitpos=[pos;[posx(1:end-1);posy(1:end-1);posz(1:end-1)]'];
%%
[nn,~]=size(splitpos);
bmx=0*x; bmy=bmx; bmz=bmx;
for ii = 1:nn
    [bmx1,bmy1,bmz1,~] = mfielddis(pos,x,y,z);
    bmx=bmx+bmx1;
    bmy=bmy+bmy1;
    bmz=bmz+bmz1;
end
bmnorm = sqrt(bmx.^2+bmy.^2+bmz.^2);
end