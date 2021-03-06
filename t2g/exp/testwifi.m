%load testedgefilter.mat
load testtri.mat
%load testdistangle.mat
global G2OPosErrorAvg;
global G2ORSSErrorAvg;
global G2OPosErrorArray;
global G2ORSSErrorArray;
global FPErrorArray;
global G2OErrorArray;
global FPMeanArray;
global G2OMeanArray;


% bioObj = biograph(ConnectivityM);
% [S,C] = conncomp(bioObj);
% for i = 1 : S
%     clear edgematrixSub;
%     clear ConnectivityMSub;
%     nodeIndex = [];
%     pointposSub = [];
%     nodeIndex = find(C == i);
%     edgematrixSub = edgematrix(nodeIndex, nodeIndex);
%     ConnectivityMSub = ConnectivityM(nodeIndex, nodeIndex);
%     bioObjSub = traverse(biograph(ConnectivityMSub))
%     pointposSub(:,1) = pointpos(:,nodeIndex(1));
%     for 
% end
% %[Connectsub, cc] = bwlabel(ConnectivityM,4)
plotgraph([],pointpos,ConnectivityM);
tic
g2opostrue = g2o(edgematrix, pointpos);
plotgraph([],g2opostrue,ConnectivityM);
plotpositionsaa(pointpos,g2opostrue,ConnectivityM,1,'G2OTrue');
g2opos = g2o(edgematrix, tri_pos');
[D,Z,T]=procrustes(pointpos', g2opos', 'Scaling', false);
registg2oPos=Z;
plotgraph([],registg2oPos',ConnectivityM);
plotpositionsaa(pointpos,registg2oPos',ConnectivityM,1,'G2O');
% plotgraph([],g2opos,ConnectivityM);
% plotpositionsaa(pointpos,g2opos,ConnectivityM,1,'G2O');

% for i = 1 : nodelength      
%     for k = 1 : Nap
%         d = pdist2(ApLoc(k,:), pointpos(:,i)');
%         gdRSS(k,i) = St-S0-10*2*log(d/1);
%     end
% end
%g2oerror = [];
%g2oRSSerror = [];
g2oRSS = [];
for i = 1 : nodelength
    %g2oerror = [g2oerror, norm(pointpos(:,i)-g2opos(:,i), 2)];
    %g2oRSSerror = [g2oRSSerror, norm(gdRSS(:,i)-point(i).clusterRSS, 2)];
    g2oRSS = [g2oRSS, point(i).clusterRSS];
end
%G2OPosErrorAvg = mean(g2oerror)/StepSize;
%G2ORSSErrorAvg = mean(g2oRSSerror);

% figure
% %subplot(2,1,1) 
% set(cdfplot(g2oerror/(20)), 'linewidth', 2,'color', 'b', 'marker', '+');
% xlabel('Position errors(m)'); ylabel('CDF'); title('');
% % subplot(2,1,2)
% % set(cdfplot(g2oRSSerror), 'linewidth', 2, 'color', 'm', 'marker', 'o');
% % xlabel('RSS errors(dbm)'); ylabel('CDF'); title('');
save testwifi.mat
