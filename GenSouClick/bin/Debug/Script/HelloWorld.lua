--��ˢǰ�����ô���
function Setup()
	local a = 10
	ClickSingle("saizen") --��ȡ��Ǯ
	Delay(500) --�ӳ�1��
	ClickSingle("main_blank") --����հ״�
	LogInfo("�ҿ�ʼˢͼ�ˣ�������Ϣ")  --��¼��Ϣ
	LogWarn("���棺��ֻ��һ����ʾDemo��") --��¼����
	LogDebug("����һ�����Լ�¼ a="..a)	--��¼����
end

local rest = 5
--ѭ������
function Loop()


	local rt = Fun1();	--ִ�к���1
	if(rt[1] == false) then	--���ִ�к���1����
		SetError(rt[2])	--���÷��صĴ�����Ϣ
		BreakLoop(); --�˳���ѭ��
		return;	
	end
	
	Fun2("���ǲ��Ժ���2") --ִ�в��Ժ���2
	
	if(rest <= 0)
	then
		BreakLoop()	--�˳���ѭ��
		return
	end
	rest = rest - 1
	SetLabel(rest)	--���á�ʣ���������ǩ

end

--������β����
function Finalize(_iserr,_errinfo)	--_iserr=�Ƿ���� _errinfo=������Ϣ
	if(not _iserr) then
		ShowMessageBox("ˢ���ˣ�")
		LogError("������û�к����߽��ף�")		
	else
		LogError(_errinfo)  --��¼����
	end
end


function Fun1()
	succ = CheckPlace("main")	--��鵱ǰ�����Ƿ�Ϊ������
	if(not succ) then
		
		return {false,"û�д������濪ʼ��"}
	end
	Delay(500);	--��ʱ500����
	ClickSingle("taiji");	--������ΰ�ť
	succ = WaitForPlace("map")	--�ȴ�������ͼ����
	if(not succ) then
		return {false,"������ͼʧ�ܣ�"}
	end
	ClickMap("hakurei")	--������ͼ���������硱
	WaitForPlace("main")	--�ȴ��ص�������

	return {true};
end

function Fun2(a)
	local i = 10
	while i>0 do
		LogDebug(a)
		Delay(200)
		i = i - 1
	end
	
end