local aaa = 100 --�ܹ�ˢ100��
local succ
--��ˢǰ�����ô���
function Setup()
	LogInfo("��ʼˢ")  --��¼��Ϣ
	SetLabel(aaa);	--���á�ʣ���������ǩֵ
	--ClickSingle("saizen");
	--Delay(200);
	
end

--ѭ������
function Loop()
	

	local rt = MyMission();
	if(rt[1] == false) then
		SetError(rt[2])	--���÷��صĴ�����Ϣ
		BreakLoop(); --�˳���ѭ��
		return;	
	end
	
	if(aaa <= 0)
	then
		BreakLoop();
		return
	end
	aaa = aaa - 1;
	SetLabel(aaa);
end

--������β����
function Finalize(_iserr,_errinfo)	--_iserr=�Ƿ���� _errinfo=������Ϣ
	if(not _iserr) then
		LogError("ˢ���ˣ�");
		ShowMessageBox("ˢ���ˣ�");
	else
		LogError(_errinfo);  --��¼����
	end
end

function MyMission()
	succ = CheckPlace("main")	--��鵱ǰ����
	if(not succ) then
		
		return {false,"û�д������濪ʼ��"};
	end
	Delay(500);
	ClickSingle("taiji");	--�������
	succ = WaitForPlace("map")	--�ȴ�������ͼ����
	if(not succ) then
		return {false,"������ͼʧ�ܣ�"}
	end
	ClickMap("gengo")	--ѡ����ͼ������֮����
	Delay(500)
	ClickGroup("team",3)	--ѡ�����3
	Delay(160)
	ClickGroup("submap",1)	--ѡ���ӵ�ͼ1
	succ = WaitForPlace("hardness",200)
	if(not succ) then
		return {false,"�����Ѷ�ѡ�����ʧ�ܣ�"}
	end
	ClickGroup("hardness", "normal");
	Delay(100)
	ClickSingle("go");
	succ = WaitForPlace("standby")
	if(not succ) then
		return {false,"�����Ѷ�ѡ�����ʧ�ܣ�"}
	end
	while true do
		succ = WaitForPlace("forward",200,20);	--�ȴ�����ǰ�����棬��ѵ����200�������20��
		if(not succ) then
            break;
    	end
    	ClickSingle("forward")
    	WaitForPlace("scorebord", 500, 999);	--�ȴ��Ʒְ�������
    	ClickSingle("center")
    	local plc = WaitForPlaces({"map","forward"},200,25)	--�ȴ��������֮һ����
    	if(plc == "map") then
	    	break;
    	end
	end
	ClickMap("hakurei")
	WaitForPlace("main",200,20)
	
	
	
	return {true,""};
end