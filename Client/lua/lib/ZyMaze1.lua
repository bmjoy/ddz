------------------------------------------------------------------
--ZyMaze.lua
-- Author     : JMChen
-- Version    : 1.0.0.0
-- Date       : 2011-10-15
-- Description:
------------------------------------------------------------------


module("ZyMaze", package.seeall)

local OpenList={}
local changeOpenList={}
local CloseList={}
local titleMap=nil
local OBLIQUE = 14;
local STEP = 10;

local minPoint={}

function initResource()
	 OpenList={}
	 changeOpenList={}
	 CloseList={}
end;


--Ѱ·�㷨
--��ʼ�� ��ֹ�� �Ƿ����ת�� �ϰ��㣨titleMap��
function  findPath(startPoint,endPoint,isIgnoreCorner,wall)
    startPoint={x=42,y=27}
    endPoint={x=49,y=30}
    if endPoint.x== startPoint.x and endPoint.y== startPoint.y  then
        return 
    end
	initResource()
	titleMap=wall
	startPoint={x=startPoint.x,y=startPoint.y}
	endPoint={x=endPoint.x,y=endPoint.y}
	ZyTable.push_back(OpenList,startPoint)
	changeOpenList[startPoint.x]={}
	changeOpenList[startPoint.x][startPoint.y]=startPoint
	minPoint=startPoint
	while #OpenList~=0 do
	
		--�ҳ�Fֵ��С�ĵ�
		local tempStart =minPoint		
		changeOpenList[tempStart.x][tempStart.y]=nil
		--ZyTable.remove(OpenList, tempStart.index)
		ZyTable.push_back(CloseList,tempStart)


           --�ҳ������ڵĵ�

               local  surroundPoints = SurrroundPoints(tempStart,isIgnoreCorner);
               minPoint=nil
               if surroundPoints and #surroundPoints>0 then
               	for k, v in pairs(surroundPoints) do
               		if ZyTable.Exists1(v.x,v.y,changeOpenList) then
               		        --����Gֵ, �����ԭ���Ĵ�, ��ʲô������, �����������ĸ��ڵ�Ϊ��ǰ��,������G��F
                        		FoundPoint(tempStart, v);
               		else
               			--������ǲ��ڿ�ʼ�б���, �ͼ���, �����ø��ڵ�,������GHF
               			 NotFoundPoint(tempStart ,endPoint,v )
               		end
               	end
               	--
               	 if    ZyTable.GetValue1(endPoint.x,endPoint.y,changeOpenList) then
               	 	local endTable= ZyTable.GetValue1(endPoint.x,endPoint.y,changeOpenList)	
               	 	return changeEndTabel(endTable)
               	 end        
               end
	end;	
	return OpenList[#OpenList]
end;

--���ת��table��
function changeEndTabel(table)
	local endTable={}
	local mainType=0
	
	if table.ParentPoint then
		while  table.ParentPoint do
			local sonTable={}
			sonTable.x=table.x
			sonTable.y=table.y
			local type=calucation(table,table.ParentPoint)
			if mainType~=type then
				mainType=type
				ZyTable.insert(endTable, 1, sonTable)
			end		
			table=table.ParentPoint
		end;
	end
	return endTable
end;


function calucation(point1,point2)
	if not point2 then
		return 0
	end
	if point1.x-point2.x==1 and point1.y ==point2.y then
		return 1
	elseif point1.x-point2.x==-1 and point1.y ==point2.y then
		return 2
	elseif point1.y-point2.y==-1 and point1.x ==point2.x then
		return 3	
	elseif point1.y-point2.y==1 and point1.x ==point2.x then
		return 4
	elseif point1.y-point2.y==1  and point1.x -point2.x==1   then
		return 5		
	elseif point1.y-point2.y==-1  and point1.x -point2.x==1   then
		return 6
	elseif point1.y-point2.y==1  and point1.x -point2.x==-1   then
		return 7	
	elseif point1.y-point2.y==-1  and point1.x -point2.x==-1   then
		return 8		
	end
		return 0
end;

--
function FoundPoint(tempStart,  point)
	local G=CalcG(tempStart, point);
	if  (G < (point.G or 0)) then
                point.ParentPoint = tempStart;
                point.G = G;
                point.F=point.G+point.H
                if  not minPoint or not minPoint.F or   point.F < minPoint.F then
                	minPoint=point
                end
	end
end;



---�ҵ���С��
function FindMinPoint(table) 
	return minPoint
	--[[
            points =  ZyTable.orderBy(table,"F")
            return points[1];
            --]]
end

--��ȡĳ������Χ���Ե���ĵ�
function  SurrroundPoints(point,IsIgnoreCorner)
	local surroundPoints={}
	for x=point.x-1,point.x+1 do
		for y=point.y-1, point.y+1 do
			if CanReach(point,x,y,IsIgnoreCorner) then
				local table={}
				table.x=x
				table.y=y
				ZyTable.push_back(surroundPoints,table)
			end
		end
	end
	return surroundPoints
end;

--�ڶ�ά�����Ӧ��λ�ò�Ϊ�ϰ���
function TileGIDAt(x,y)
	if x>=0 and y>=0 and y<titleMap:getLayerSize().height  and x<titleMap:getLayerSize().width and 
        titleMap:tileGIDAt(PT(x,y)) == 0 then
				return true
	end	
	return false
end;

--�Ƿ�ɵ���
function CanReach(start,x,y,IsIgnoreCorner)
	 if not TileGIDAt(x, y)  or ZyTable.Exists(x,y,CloseList) then 
	 	return false
	 else
	 	if (math.abs(x - start.x) + math.abs(y - start.y) == 1) then
	 		return true
	 	else
	 		--�����б�����ƶ�, �ж��Ƿ� "���
	 		if (TileGIDAt(math.abs(x - 1), y) and TileGIDAt(x, math.abs(y - 1))) then
                        return true;
                    else
                        return IsIgnoreCorner;
                     end    
	 	end 	
	 end	  
end;


function NotFoundPoint(tempStart ,endPoint,point )
	point.ParentPoint=tempStart
 	point.G = CalcG(tempStart, point);
       point.H = CalcH(endPoint, point);
	point.F=point.G+point.H
	if not minPoint or not minPoint.F or point.F < minPoint.F then
                	minPoint=point
	end
	if not changeOpenList[point.x] then
	    changeOpenList[point.x]={}
	end
	changeOpenList[point.x][point.y]=point
	ZyTable.push_back(OpenList,point)
end;


----
function CalcG(start,point)
            local  G = (math.abs(point.x - start.x) + math.abs(point.y - start.y)) == 1 and STEP or OBLIQUE;
            local  parentG = point.ParentPoint ~= nil and  point.ParentPoint.G or 0;
            return G + parentG;
end;


function CalcH(endPoint,point)
	local step = math.abs(point.x - endPoint.x) + math.abs(point.y - endPoint.y);
	return step * STEP;
end;



