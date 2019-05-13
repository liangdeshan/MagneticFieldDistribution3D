clear;clc
% close all
figure('WindowState','maximized');
%% 方位角azimuth为0到2*pi，仰角elevation为-pi/2到pi/2
density = 10;
space_m = 1; 

xx = linspace(-space_m,space_m,density);
yy = xx; zz = xx;
[x,y,z] = ndgrid(xx,yy,zz);
%% for pie
Rpie=0.5;  Hpie=0.1; pos = [0 0 0];
creatpie(pos,Rpie,Hpie)
[bmx,bmy,bmz,bmnorm] = piemfield(pos,Rpie,x,y,z);
%% pickup
bmxyz = sqrt(bmx.^2+bmy.^2+bmz.^2);

bmx(bmxyz>5e3)=0;
bmy(bmxyz>5e3)=0;
bmz(bmxyz>5e3)=0;

bmx(bmxyz<5e2)=0;
bmy(bmxyz<5e2)=0;
bmz(bmxyz<5e2)=0;
%%
for ii=1:density
    for jj=1:density
        for kk=1:density
            %% 2019.04.19,15:30
            %         deltaV = [uu(ii),vv(ii),ww(ii)]*0.8;
            %         pos=[xx(ii),yy(ii),zz(ii)]-0.0*deltaV;
            %         datacolor=norm(deltaV);
            % %%
            %         arrow3D(pos,deltaV,ww(ii));
            %%
            %         deltaV = [uu(ii),vv(ii),ww(ii)]*1.5;
            deltaV = [bmx(ii,jj,kk),bmy(ii,jj,kk),bmz(ii,jj,kk)];
            deltaV = 1e-4*deltaV;
            
            pos=[x(ii,jj,kk),y(ii,jj,kk),z(ii,jj,kk)]-0.5*deltaV;

            %%
            if norm(deltaV)>0
%                 arrow3D(pos,deltaV,1);
            end
        end
    end
end

quiver3(x,y,z,bmx,bmy,bmz,0.8,'LineWidth',1.5,'Color',[0.5,0.5,0.5])
%%

axis(gca,'tight')
% axis([-1 1 -1 1 -2 2])
box(gca,'on');
set(gca,'BoxStyle','full','DataAspectRatio',[1 1 1]);
axis off
colormap jet
caxis([0,2])
%%
h=light;
lightangle(h,45,45)
h1=light;
lightangle(h1,-45,-45)
lighting gouraud