clc;

NAMES = {'biarc'} ;

LIBS = [ ...
  '-I../src ../src/Clothoid.cc ' ...
  '../src/Triangle2D.cc ' ...
  '../src/CubicRootsFlocke.cc ' ...
  '../src/Circles.cc ' ...
] ;

disp('---------------------------------------------------------');
for k=1:length(NAMES)
  N=NAMES{k} ;
  fprintf(1,'Compiling: %s\n',N) ;

  CMD = ['mex -output ',N,' -largeArrayDims ../src_mex/mex_',N,'.cc ', LIBS] ;
  if isunix
    if ismac
      CMD = [CMD, ' -lstdc++ CXXFLAGS="\$CXXFLAGS -Wall -O2 -g0"'] ;
    else
      CMD = [CMD, ' -lstdc++ CXXFLAGS="\$CXXFLAGS -Wall -O2 -g0"'] ;
    end
  elseif ispc
  end
  disp(CMD);
  eval(CMD);
end
disp('----------------------- DONE ----------------------------');