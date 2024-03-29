%Test the Funk
FunkParams.OuterRadius= 3;  % the circle of the centres of the circles
                            % overwhich we integrate
FunkParams.ImageMaxRadius = 1;
%  The square image has this many pixels
FunkParams.PixelsXY = 20;
NCircles=20;
FunkParams.Thetas= linspace(0, 2*pi,NCircles)*180/pi;
NRadii=40;
FunkParams.Radii= linspace(FunkParams.OuterRadius - FunkParams.ImageMaxRadius,...
                   FunkParams.OuterRadius + FunkParams.ImageMaxRadius,NRadii);
FunkParams.Inc= sqrt(2)*FunkParams.ImageMaxRadius/FunkParams.PixelsXY;
A = FunkMakeA(FunkParams);
close all
figure,spy(A);
for i=[70, 170,280,320]
    figure, imagesc(reshape(A(i,:),20,20));
end
ss=svd(full(A));
figure, plot(ss(1:end-3))
figure, semilogy(ss(1:end-3));
xx=sparse(400,1);
xx(250)=1;
bb = A*xx;
figure, imagesc(reshape(A\bb,20,20));
figure, imagesc(reshape(A\(bb+ 0.05*randn(size(bb))),20,20));

