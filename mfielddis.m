function [bmx,bmy,bmz,bmnorm] = mfielddis(pos,x,y,z)
% magnetic field distribution
% pos of magnet
% x y z is spatial
% bmx bmy bmz is mfield distribution
% bmnorm is mfield strength
%%
mu0 = 1;
II = 1000;
R = 1;
pm = II*pi*R^2;

%%
% [azimuth,elevation,r] = cart2sph(x,y,z);
rx = x-pos(1);
ry = y-pos(2);
rz = z-pos(3);
rnorm = sqrt(rx.^2+ry.^2+rz.^2);
%%
bmx = mu0/(4*pi)*( ...
    (3*(pm*rz).*rx)./(rnorm.^5) ...
    );

bmy = mu0/(4*pi)*( ...
    (3*(pm*rz).*ry)./(rnorm.^5) ...
    );

bmz = mu0/(4*pi)*( ...
    (3*(pm*rz).*rz)./(rnorm.^5) ...
    -(pm./(rnorm.^3)));
bmnorm = sqrt(bmx.^2+bmy.^2+bmz.^2);
end

