function Popreal = CS(PopDec,PopObj,TSDec,TSObj) 
     % PopDec: candidate solutions, TSDec: modeling data
     % Non-dominated sorting of archived data
     [FrontNo,~] = NDSort(TSObj,inf);
     ND_TSObj = TSObj(FrontNo==1,:);
     ND_TSDec = TSDec(FrontNo==1,:);
     
     % Non-dominated Sorting of Candidate Solution Data
     [FrontNo1,~] = NDSort(PopObj,inf);
     ND_PopObj = PopObj(FrontNo1==1,:);
     ND_PopDec = PopDec(FrontNo1==1,:);   
     
     % parameters
     Popreal = [];
     rand1 = 1;

     %% Sampling Strategy
     if rand < rand1
         if ~isempty(PopDec)
             [Popreal_Dec1, Popreal_Obj1, index] = CI(ND_TSDec,ND_TSObj,ND_PopDec,ND_PopObj,TSDec,TSObj); % Composite indicator sampling
             Popreal = [Popreal; Popreal_Dec1];
         end
     end
end


