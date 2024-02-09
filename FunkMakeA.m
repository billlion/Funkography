function A = FunkMakeA(FP)
%   A=FunkMakeA(FunkParams) 
%   A linear forward problem based operator on integrating over circle
%   Makes a sparse matrix, for a problem assumed small rather than
%   computing on the fly
A= sparse(length(FP.Radii)*length(FP.Thetas),FP.PixelsXY^2);

Xs=linspace(-sqrt(2)*FP.ImageMaxRadius,sqrt(2)*FP.ImageMaxRadius,FP.PixelsXY);

[X,Y]=meshgrid(Xs,Xs);%Maybe should be midpoints
thismeas=1;
for r=FP.Radii
  for th=FP.Thetas
      [x0,y0]=pol2cart(th,FP.OuterRadius);
      SrcPt=[x0*ones(1,FP.PixelsXY^2);y0*ones(1,FP.PixelsXY^2)];
      [rw,col,v]=find(norm([X(:),Y(:)]-SrcPt')<=r+FP.Inc/sqrt(2)&...
          norm([X(:),Y(:)]-SrcPt')>=r-FP.Inc/sqrt(2));
      if ~isempty(v)
        Arow=sparse(rw,col,v);
        A(thismeas,:)=Arow(:);
      end
      thismeas=thismeas+1;
  end
end

end




