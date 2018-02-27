function matrix = ratioCalculator(financialFile)
rawFinData = importdata(financialFile);
finData = rawFinData.data;
Scale = 0;
% Total Asset Turnover = Gross Profit / Total Assets
c = finData(10) / finData(9);
function CurrentRatio = CalculateCurrentRatio(c)
CurrentRatio = round(c,2);
if CurrentRatio == 1 
      Scale = Scale + 0;
    fprintf('As the current ratio results in 1, it indicates that the company \n currently owes what they have in terms of value')
elseif CurrentRatio < 1
      Scale = Scale -2;
        Percentage= 100 -(CurrentRatio*100);
        fprintf('As the current ratio results in %3.2f , it indicates that the company \n currently owes %2.0f percent more than what \n they own in terms of value',CurrentRatio,Percentage)
elseif CurrentRatio > 1 || CurrentRatio < 2
      Scale = Scale + 1;
        Percentage = (CurrentRatio*100) - 100;
         fprintf('As the current ratio results in %3.2f , it indicates that the company \n currently owns %2.0f percent more than what they owe in terms of value',CurrentRatio,Percentage)
elseif CurrentRatio == 2 
      Scale = Scale + 2;
    fprintf('As the current ratio results in 2, it indicates that the company \n currently owns twice of what they owe in terms of value')
else
      Scale = Scale + 2;
    Percentage = (CurrentRatio*100) - 100;
    fprintf('As the current ratio results in %3.2f , it indicates that the company \n currently owns %2.0f percent more than what they owe in terms of value',CurrentRatio,Percentage)
end
end
t = finData(3) / finData(14);
function TotalAssetTurnOver = CalculateTotalAssetTurnOverRatio(t)
TotalAssetTurnOver = round(t,3);
    fprintf('As the Total Asset Turnover Ratio results in %3.2f , \n it indicates for every dollar the company has in Asset, \n the company generates $ %3.2f in sales. ',TotalAssetTurnOver,TotalAssetTurnOver)
if TotalAssetTurnOver >= 2
    Scale = Scale + 2;
    fprintf('The company is in a good standing in \n regards to its Total Asset Turnover Ratio.')
elseif (TotalAssetTurnOver < 2) && (TotalAssetTurnOver >= 1)
    Scale = Scale + 1;
    fprintf('The company is in a good nor bad standing \n but it definitely has room for improvement.')
else
    Scale = Scale - 1;
    fprintf('The company is not in a good standing \n because it returns far less than a dollar for every dollar they have in asset.')
end
end

% Inventory Turnover = Cost of Sales / Inventory
i = finData(2) / finData(5);
function InventoryTurnOver = CalculateInventoryTurnOverRatio(i)
InventoryTurnOver = round(i,2);
RateOfTurnOver = round(365/InventoryTurnOver,2);
fprintf(' From the calculation, the inventory is being turned over %3.2f times a year \n and it turns every %3.2f days.',InventoryTurnOver, RateOfTurnOver)
if InventoryTurnOver >= 20
      Scale = Scale + 1;
        fprintf('since the inventory is being turned over more than 20 times a year, the \n company is doing a great job selling \n and replenishing their inventory.')
else
      Scale = Scale + 0;
         fprintf('since the inventory is being turned over less than 20 times a year, the \n company is doing a very poor job selling \n and replenishing their inventory.')
end
end
% Quick Ratio = (Total Current Assets - Inventory) / Total Current
% Liabilitiies
q = (finData(9)-finData(5)) / finData(10);
function QuickRatio = CalculateQuickRatio(q)
QuickRatio = round(q,3);
fprintf('Quick ratio is utilized to see if a company is \n capable of paying back its short term debts')
if QuickRatio >= 2
      Scale = Scale + 2;
    fprintf('According to the calcualtion, the company has a quick ratio of %3.2f. \n This means that the company has $ %3.2f to pay back every dollar it \n has in short term debts. It is a very healthy company to be considered.',QuickRatio,QuickRatio)
elseif (QuickRatio < 2) && (QuickRatio >= 1)
      Scale = Scale + 1;
    fprintf('According to the calcualtion, the company has a quick ratio of %3.2f. \n This means that the company has $ %3.2f to pay back every dollar it \n has in short term debts. The company may struggle a little, but it will be able to pay for its short term debts',QuickRatio,QuickRatio)
else
      Scale = Scale + 0;
    fprintf('The company is not in a good standing because it does not have \n the financial capability to pay for its short term debt. ')
end
end
% Leverage Ratio = Total Debt / Total Assets
d = finData(12) / finData(14);
function LeverageRatio = CalculateLeverageRatio(d)
LeverageRatio = round(d,3);
if LeverageRatio == 1 
      Scale = Scale + 1;
    fprintf('As the leverage ratio results in 1, it indicates that the company relies \n on their debt to run the company.')
elseif LeverageRatio < 1
      Scale = Scale +2;
       Percentage = (LeverageRatio*100);
        fprintf('As the leverage ratio results in %3.2f , it indicates that the company \n does not fully rely on debt financing as a source of growth for \n the company because %3.2f percent of the company"s total asset is from debt financing.',LeverageRatio,Percentage)
elseif LeverageRatio > 1 || LeverageRatio < 2
      Scale = Scale + 0;
        Percentage = (LeverageRatio*100) - 100;
         fprintf('As the leverage ratio results in %3.2f , it indicates that the company \n relies slightly on debt financing as a source of growth for \n the company because more than %3.2f percent of the company"s total asset is from debt financing.',LeverageRatio,Percentage)
elseif CurrentRatio == 2 
      Scale = Scale -1;
    fprintf('As the leverage ratio results in 2 , it indicates that the company relies \n 100 percent on debt financing as a source of growth for the company.')
else
      Scale = Scale - 2;
    Percentage = (CurrentRatio*100) - 100;
   fprintf('As the leverage ratio results in %3.2f , it indicates that the company \n relies heavily on debt financing as a source of growth for \n the company because more than %3.2f percent of the company"s total asset is from debt financing.',LeverageRatio,Percentage)
end
end
CalculateCurrentRatio(c)
CalculateTotalAssetTurnOverRatio(t)
CalculateInventoryTurnOverRatio(i)
CalculateQuickRatio(q)
CalculateLeverageRatio(d)
Scale = Scale;
if Scale <= 3 
    fprintf('WARNING!! The investment Index shows a value of %3.0f. \n This indicates that it is a bad investment.',Scale)
elseif Scale >3 && Scale <=6
    fprintf('The investment Index shows a value of %3.0f. \n This indicates that it is a risky investment.',Scale)
else
    fprintf('The investment Index shows a value of %3.0f. \n This indicates that it is a great potential investment.',Scale)
end
end