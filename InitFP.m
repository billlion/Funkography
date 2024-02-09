function FunkParam=InitFP(FP)
% function FunkParam=InitFP(FP)
% Initializes the calculated FunkParameters
if ~isfield(FP, 'A')
 FP.A= sparse(length(FP.Radii)*length(FP.Thetas),FP.PixelsXY^2);
 FP.Xs=linspace(-sqrt(2)*FP.ImageMaxRadius,sqrt(2)*FP.ImageMaxRadius,FP.PixelsXY);             
 [FP.X,FP.Y]=meshgrid(FP.Xs,FP.Xs);%Maybe should be midpoints
end
FunkParam=FP;
end