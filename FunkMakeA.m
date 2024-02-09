function A = FunkMakeA(FP)
%   A=FunkMakeA(FunkParams) 
%   A linear forward problem based operator on integrating over circle
%   Makes a sparse matrix, for a problem assumed small rather than
%   computing on the fly
FP=InitFP(FP);
thismeas=1;
for r=FP.Radii
  for th=FP.Thetas 
      [x0,y0]=pol2cart(th,FP.OuterRadius);
      SrcPt=[x0*ones(1,FP.PixelsXY^2);y0*ones(1,FP.PixelsXY^2)];
      [rw,col,v]=find(...
            sum(([FP.X(:),FP.Y(:)]-SrcPt').^2,2)<=(r+FP.Inc/sqrt(2))^2 ... 
          & sum(([FP.X(:),FP.Y(:)]-SrcPt').^2,2)>=(r-FP.Inc/sqrt(2))^2) ;
      if ~isempty(v)
        Arow=sparse(rw,col,v,FP.PixelsXY.^2,1);
        FP.A(thismeas,:)=Arow;
      end
      thismeas=thismeas+1;
  end
end
A=FP.A;
end




