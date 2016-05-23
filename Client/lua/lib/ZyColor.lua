

ZyColor = {
	_color = nil
}


--
-------------------------��̬����------------------------
--
-- ��ɫ
function ZyColor:colorYellow()
	return ccc3(255, 255, 0)
end

-- ��ɫ
function ZyColor:colorWhite()
	return ccc3(255, 255, 255)
end

-- ��ɫ
function ZyColor:colorRed()
	return ccc3(255, 0, 0)
end

-- ��ɫ
function ZyColor:colorGreen()
	return ccc3(0, 255, 0)
end

-- ��ɫ
function ZyColor:colorBlue()
	return ccc3(55, 133, 255)
end

-- ��ɫ
function ZyColor:colorPurple()
	return ccc3(139, 0, 255)
end

-- ��ɫ
function ZyColor:colorBlack()
	return ccc3(0, 0, 0)
end

-- ��ɫ
function ZyColor:colorOrange()
	return ccc3(255, 170, 0)
end

-- �Ⱥ�ɫ
function ZyColor:colorOrangeRed()
	return ccc3(255, 88, 0)
end

-- ��ɫ
function ZyColor:colorGray()
	return ccc3(111, 111,111)
end

-- ��ǩ��ɫ
function ZyColor:colorLabel()
	return ccc3(168, 179, 214)
end
--
function ZyColor:colorBlueDark()
	return ccc3(12, 162, 171)
end
--
function ZyColor:colorYellowDark()
	return ccc3(174, 124, 16)
end
--
--
function ZyColor:colorBlueLight()
	return ccc3(0, 191, 255)
end


function ZyColor:getRoleQualityColor(nQuality)
	if nQuality == 1 then--    1	�װ�
		return ZyColor:colorWhite()
	elseif nQuality == 2 then--2	��ɫ
		return ZyColor:colorGreen()
	elseif nQuality == 3 then--3	��ɫ
		return ZyColor:colorBlue()
	elseif nQuality == 4 then--4	��ɫ
		return ZyColor:colorPurple()
	elseif nQuality == 5 then--5	��ɫ
        	return ZyColor:colorYellow()	
	else
		return ZyColor:colorWhite()
	end       
end;

function ZyColor:getEquiptQualityColor(nQuality)
    if nQuality == 1 then--    1	�װ�
        return ZyColor:colorWhite()
    elseif nQuality == 2 then--2	��ɫ
        return ZyColor:colorBlue()
    elseif nQuality == 3 then--3	��ɫ
        return ZyColor:colorPurple()
    elseif nQuality == 4 then--4	��ɫ
        return ZyColor:colorOrange()
    elseif nQuality == 5 then--5	��ɫ
        return ZyColor:colorYellow()
--    elseif nQuality == 6 then--6 ��ɫ
--    	  return ZyColor:colorRed()
    else
        return ZyColor:colorWhite()
    end
end

function ZyColor:getCrystalColor(nQuality)
    if nQuality == 1 then--    1	��ɫ
	return ccc3(255, 255, 255)--�ҵĿ�����     �׵�
    elseif nQuality == 2 then--2	��ɫ
        return ccc3(0, 255, 0)
    elseif nQuality == 3 then--3	��ɫ
        return ccc3(0, 0, 255)
    elseif nQuality == 4 then--4	��ɫ
        return ccc3(139, 0, 255)
    elseif nQuality == 5 then--5	��ɫ
        return ccc3(255, 255, 0)
    elseif nQuality == 6 then--6	��ɫ
        return ccc3(255, 170, 0)
    else
        return ccc3(128,128,128)--��ɫ
    end
end

function ZyColor:worldBlueColor()
	return ccc3(125, 0, 0)
end

