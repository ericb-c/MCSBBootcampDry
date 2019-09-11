<<<<<<< HEAD
% generate one million points on [-2,2] and [-2i,2i] then run follow_z on
% each point

numPts=floor(sqrt(10^6));

p=4*(rand(numPts)-.5)+4*1i*(rand(numPts)-.5);
nmax=zeros(size(p,1)*size(p,2),1);

for k=1:size(p,1)*size(p,2)
    [~,nmax(k)]=follow_z(p(k),c);
end
=======
% Jun Allard jun.allard@uci.edu
% Algorithm choices: 
% (1) This code uses variables that are complex number. One
% could alternatively use just real numbers, and represent complex numbers
% as a pair of real numbers.
% (2) We explore p values randomly uniformly in a rectangular range. We could
% alternatively explore p values in a grid.

% should set a complex number c before running
if ~exist('c','var')
    error('Need a value for the parameter stored in c')
end

NStartingPoints=1E6;

% random starting points p, uniform in a rectangular region of the complex
% plane
pReMin = -2;
pReMax = +2;
pImMin = -2;
pImMax = +2;

p = pReMin + (pReMax-pReMin)*rand(1,NStartingPoints) + ...
     (pImMin + (pImMax-pImMin)*rand(1,NStartingPoints))*1i;

% initialize a vector to store the escape timestep (or ntMax, if it never
% escaped)
nmax = 0*p; 
 
tic;
for iStartingPoint=1:NStartingPoints
    
    nmax(iStartingPoint)=followz(p(iStartingPoint),c);

end % finished loop through starting points
toc
>>>>>>> 908d3a8fff70b879933643c90959e8991b06c82e
