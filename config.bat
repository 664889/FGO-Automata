@echo off
mode con cols=81 lines=25
echo ��ȷ���ѽ����ű�����FGO-AutomataĿ¼��
if exist core/Automata.py (pause&&goto :init) else (goto wrong)
:init
echo ---------------------------------------------------------------------------------
echo 1=����.py�ļ�(����)[����]                    2=�ظ�����.py�ļ�
set /p zero=��ѡ��(�����Ӧ����):
if %zero%==1 (goto :create) else if %zero%==2 (goto :end) else (goto :init)
:wrong
echo ����!�뽫���ű�����FGO-AutomataĿ¼��
pause
exit
:create
echo ---------------------------------------------------------------------------------
set /p name=�������ļ���(�������Ĭ�Ϻ�׺.py,��Enterȷ��):
echo from core.Automata import Automata > %name%.py
echo # start  >> %name%.py
echo ��������Ϸ����ƫ������(��Ϊ1920x1080��x,y����0):
set /p x=x=
set /p y=y=
set /p support=��������սͼƬ(����assets��,png��ʽ,���������׺):
echo �Ƿ���и߼���ս����?      1=�� 2=��
echo �߼���սѡ���Զ�������дͼƬ��ǰ������սƥ�䣬ƥ�䲻������й������
echo �����Ȼû���κ�ƥ������������б����(5s)���ظ�ѭ����
set /p supportselect=��ѡ��(�����Ӧ����):
goto :select
:end
set /p lim=�������ظ�����:
set num=0
:main
set /p namezero=������Ҫ���е��ļ���(�������Ĭ�Ϻ�׺.py,��Enterȷ��):
echo ��ʼ����,����Ϊ%lim%��
goto :re1
:re1
if %num%==%lim% (pause&&echo.ѭ�������&&exit) else (goto :re2)
:re2
py %namezero%.py
set /a num+=1
echo ��%num%���������
goto :re1
:select
cls
echo ---------------------------------------------------------------------------------
echo ��ѡ��ÿ�ո���
echo 1=���� 2=������ 3=QP�� 4=�Զ���
set /p stage=��ѡ��(�����Ӧ����):
if %stage%==1 (goto :ember) else if %stage%==2 (goto :training) else if %stage%==3 (goto :qp) else if %stage%==4 (goto :custom) else (goto :select)
:ember
echo 1=��������   2=�����м�   3=�����ϼ�   4=��������
echo ---------------------------------------------------------------------------------
set /p start1=��ѡ��ȼ�(�����Ӧ����):
echo fgo = Automata("assets/cn/Ember%start1%.png", "assets/%support%.png", sft=(%x%, %y%)) >> %name%.py
goto :appleconfirm
:training
echo ---------------------------------------------------------------------------------
echo 1=���������� 2=�������м� 3=�������ϼ� 4=����������
set /p start2=��ѡ��ȼ�(�����Ӧ����):
echo fgo = Automata("assets/cn/Training%start2%.png", "assets/%support%.png", sft=(%x%, %y%)) >> %name%.py
goto :appleconfirm
:qp
echo ---------------------------------------------------------------------------------
echo 1=QP������   2=QP���м�  3=QP���ϼ�  4=QP������
set /p start3=��ѡ��ȼ�(�����Ӧ����):
echo fgo = Automata("assets/cn/Qp%start3%.png", "assets/%support%.png", sft=(%x%, %y%)) >> %name%.py
goto :appleconfirm
:custom
echo ---------------------------------------------------------------------------------
set /p start4=�������Զ���ؿ�ͼƬ��(png,�������assetsĿ¼��,����Ҫ�����׺)
echo fgo = Automata("assets/%start4%.png", "assets/%support%.png", sft=(%x%, %y%)) >> %name%.py
goto :appleconfirm
:appleconfirm
set /p apple=�Ƿ�ʹ��ƻ�� ������1 ������2:
if %apple% gtr 2 (goto :applewrong) else (goto :applenext)
:applewrong
echo ������1��2!
pause
goto :appleconfirm
:applenext
if %apple%==1 (goto :eat) else if %apple%==2 (goto :game) else (goto :game)
:eat
set /p a1=��ƻ������1 ��ƻ������2 ʥ��ʯ����3:
if %a1%==1 (goto :gold) else if %a1%==2 (goto :silver) else if %a1%==2 (goto :quartz) else (goto :eat)
:gold
echo fgo.set_apples(1, "assets/gold.png")>>%name%.py
goto :game
:silver
echo fgo.set_apples(1, "assets/silver.png")>>%name%.py
goto :game
:quartz
echo fgo.set_apples(1, "assets/quartz.png")>>%name%.py
goto :game
:game
if %supportselect%==1 (goto :advancegame) else (goto :normalgame)
:advancegame
echo fgo.quick_start(advance=True) >> %name%.py
goto :battle
:normalgame
echo fgo.quick_start(advance=False) >> %name%.py
goto :battle
:battle
cls
echo ---------------------------------------------------------------------------------
echo �밴˳������غ���(����δ���õڶ��غ�ֱ�����õ�һ�غ�!)
echo 1=Battle_1 2=Battle_2 3=Battle_3 4=��������[����]
set /p ro=����������:
if %ro%==1 (goto :battle1) else if %ro%==2 (goto :battle2) else if %ro%==3 (goto :battle3) else if %ro%==4 (goto :finish) else (goto :battle)
:battle1
cls
echo # battle1 >> %name%.py
goto :menu
:battle2
cls
echo # battle2 >> %name%.py
goto :menu
:battle3
cls
echo # battle3 >> %name%.py
goto :menu
:menu
cls
echo ---------------------------------------------------------------------------------
echo [ע��] �������ó���˳��ǰ������Ӽ��ܵ��趨
echo 1=��Ӵ��߼���[��ѡ]
echo 2=�����������[��ѡ]
echo 3=���ó���˳��[����]
echo 4=��ɻغ�����
echo 5=��������
echo 6=����Զ�ս��[�������ó���˳��][��ѡ]
set /p num=����������:
if %num%==1 (goto :skill) else if %num%==2 (goto :master) else if %num%==3 (goto :card) else if %num%==4 (goto :battle) else if %num%==5 (goto :extra) else if %num%==6 (goto :dynamica) else (goto :menu)
:skill
cls
echo ---------------------------------------------------------------------------------
echo ʹ��ǰ��رռ���ʹ��ȷ��!
echo ����1Ϊû��Ŀ����ߵļ���,����2Ϊ��Ŀ����ߵļ���,�����������ز˵�:
set /p sc=����������:
if %sc%==1 (goto :1) else if %sc%==2 (goto :2) else (goto :menu)
:1
echo ����û��Ŀ����ߵļ��ܣ��硰ֱ��֮ħ�ۡ�������������1��9��������������
set /p s1=����������:
echo fgo.select_servant_skill(%s1%) >> %name%.py
echo ������
set /p sc1=�Ƿ������Ӵ��߼��� 1Ϊ�� 2Ϊ��:
echo ---------------------------------------------------------------------------------
if %sc1%==1 (goto :skill) else (goto :menu)
:2
echo ������Ŀ����ߵļ��ܣ��硰��ʼ��¬��������Ҫ�ṩ��������
echo ��һ��Ϊ�������֣���������1��9������������
echo �ڶ���ΪĿ����ߣ�1��3�������Ҷ�Ӧ�Ĵ��ߣ�
set /p n1=��һ������:
set /p n2=�ڶ�������:
echo fgo.select_servant_skill(%n1%, %n2%) >> %name%.py
echo ������
set /p sc1=�Ƿ������Ӵ��߼��� 1Ϊ�� 2Ϊ��:
echo ---------------------------------------------------------------------------------
if %sc1%==1 (goto :skill) else (goto :menu)
:master
cls
echo ---------------------------------------------------------------------------------
echo ����1Ϊû��Ŀ����ߵ���������,����2Ϊ��Ŀ����ߵ���������
echo ����3���Order Change����(��Ҫ��װ),�����������ز˵�:
set /p sc=����������:
if %sc%==1 (goto :3) else if %sc%==2 (goto :4) else if %sc%==3 (goto :oc) else (goto :menu)
:3
echo ����û��Ŀ����ߵ���������,����������1��3��������������
set /p s1=����������:
echo fgo.select_master_skill(%s1%) >> %name%.py
echo ������
set /p sc2=�Ƿ��������������� 1Ϊ�� 2Ϊ��:
echo ---------------------------------------------------------------------------------
if %sc2%==1 (goto :master) else (goto :menu)
:4
echo ������Ŀ����ߵ���������,��Ҫ�ṩ��������
echo ��һ��Ϊ����������������1��3������������
echo �ڶ���ΪĿ����ߣ�1��3�������Ҷ�Ӧ�Ĵ��ߣ�
set /p n1=��һ������:
set /p n2=�ڶ�������:
echo fgo.select_master_skill(%n1%, %n2%) >> %name%.py
echo ������
set /p sc3=�Ƿ��������������� 1Ϊ�� 2Ϊ��:
echo ---------------------------------------------------------------------------------
if %sc3%==1 (goto :master) else (goto :menu)
:oc
echo ��ȷ����װ��ȷ!
set /p o1=�����뱻�滻�Ĵ���(1��3��ǰ���������Ҷ�Ӧ�Ĵ���):
set /p o2=�������ϳ��Ĵ���(1��3�������������Ҷ�Ӧ�Ĵ���):
echo fgo.select_master_skill(3, %o1%, %o2%) >> %name%.py
echo Order Change������
set /p sc4=�Ƿ��������������� 1Ϊ�� 2Ϊ��:
echo ---------------------------------------------------------------------------------
if %sc4%==1 (goto :master) else (goto :menu)
:card
cls
echo ---------------------------------------------------------------------------------
echo ����Ҫ�ṩһ�����3��Ԫ�ص�����
echo ����1��5Ϊ�����ҵ�������ָͨ�
echo 6��8Ϊ�����ҵ�3�ű��߿�
echo ��Ҳ���Բ�ѡ��������ʣ�µĿ���������䡣
echo ��ʽ:��ֻ��һ�ſ������뵥������
echo �����ſ����ð��Ӣ�ķ���[ , ]�ָ� �� 1, 2, 3
set /p sel=������:
echo fgo.select_cards([%sel%]) >> %name%.py
echo ����˳�����
pause
echo ---------------------------------------------------------------------------------
goto :menu
:extra
cls
echo ---------------------------------------------------------------------------------
echo 1=�����ȴ�
echo 2=�����Ļ
echo 3=��/�ر������������(��ȷ��)
echo 4=���ز˵�
set /p ex=����������:
if %ex%==1 (goto :wait) else if %ex%==2 (goto :tap) else if %ex%==3 (goto :panel) else (goto :menu)
:wait
echo It allows you idle the script till a certain scene
echo It receives an argument of the path of the template image.
echo Example  assets/checkpoint.png
set /p wa=Enter the path:
echo ---------------------------------------------------------------------------------
echo fgo.wait("%wa%") >> %name%.py
goto :menu
:tap
echo Allows to tap a certain point in the screen
echo The first arg is a tuple of the coordinate (x, y)
echo The 2nd and the 3rd args are random shifts in x and y,
echo if you don't want have any shifts, replace with 0
echo Example (100, 100), 0, 0 You only need enter the number
set /p tax=Enter the number x:
set /p tay=Enter the number y:
set /p ta2=Enter the number 2nd:
set /p ta3=Enter the number 3rd:
echo ---------------------------------------------------------------------------------
echo fgo.tap((%tax%, %tay%), %ta2%, %ta3%) >> %name%.py
goto :menu
:panel
echo You can use this function to turn on/off the Master skill panel.
echo ---------------------------------------------------------------------------------
echo fgo.toggle_master_skill() >> %name%.py
goto :menu
:dynamica
cls
echo ---------------------------------------------------------------------------------
echo # use_dynamica >> %name%.py
echo [ע��] ��̬ս�������ᷢ������
echo [ע��] ��̬ս���������ó���˳��
echo ��̬ս�� ����Լ��ܣ������Լ�����
set /p round=������ʹ�ö�̬ս���Ļغ���[Battle id](1~3):
echo fgo.use_dynamica(%round%) >> %name%.py
echo ������
pause
goto :menu
:finish
cls
echo #finish >> %name%.py
echo ---------------------------------------------------------------------------------
echo fgo.finish_battle() >> %name%.py
echo ��� �����ظ����������и��ļ� ����������py %name%.py
echo �Ƿ񼴿�����? 1=�� 2=��
set /p run=����������:
if %run%==1 (goto :end) else (goto :complete)
:complete
pause
exit
echo ---------------------------------------------------------------------------------
pause
exit