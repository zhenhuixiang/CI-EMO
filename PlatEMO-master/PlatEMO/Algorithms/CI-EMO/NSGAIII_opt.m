function [PopDec,PopObj,MSE] = NSGAIII_opt(Achieve,Model,W,Problem)
          PopDec = Achieve.decs;
          PopObj = Achieve.objs;
          Zmin   = min(PopObj,[],1);
          if size(PopDec,1) >= Problem.N
             Next = nsga3EnvironmentalSelection(PopDec,PopObj,Problem.N,W,Zmin); 
             PopDec = PopDec(Next,:);
             PopObj = PopObj(Next,:);
          end
          g = 1;gmax = 20;
          beta = 0;
          while g <= gmax
                OffDec = generateOffing(PopDec,Problem,Achieve);
                PopDec = cat(1,PopDec,OffDec);  
                [PopObj,~,MSE,~] = GP_estimate(PopDec,Model,Problem.M,beta);
                Zmin  = min([Zmin; PopObj],[],1);
                Choose = nsga3EnvironmentalSelection(PopDec,PopObj,Problem.N,W,Zmin); 
                PopDec = PopDec(Choose,:);
                PopObj = PopObj(Choose,:);
                MSE = MSE(Choose,:);
                g = g+1;
          end
end

