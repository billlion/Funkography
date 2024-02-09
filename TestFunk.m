%Test the Funk
FunkParams.OuterRadius= 3;  % the circle of the centres of the circles
                            % overwich we integrate
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