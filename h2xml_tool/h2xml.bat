:: ����ɫ��0 black; 1 bule; 2 green; 3 ����ɫ; 4 red; 5 ��ɫ; 6 ��ɫ; 7 ��ɫ
:: ����ɫ��8 ��ɫ; 9 ����ɫ; a ����ɫ; b ��ǳ��ɫ; c ����ɫ; d ����ɫ; e ����ɫ; f ����ɫ
@color 0a


:: h2xml����Ŀ¼
@set toolsDir=.\h2xml
@set outFiles=kvh2xml vcpm_api


@echo ###############################################################################
@echo #            ɾ���Ѵ��ļ�
@echo ###############################################################################
@for %%a in (%outFiles%) do @(
    @if exist %%a.xml (
        echo �ļ����ڣ�ɾ�����ļ���%%a.xml
        del /S /Q %%a.xml
    ) else (
        echo �����ڵ��ļ���%%a.xml
    )
)

@echo.
@echo.

@echo ###############################################################################
@echo #            ���������µ������ļ�
@echo ###############################################################################
@for %%a in (%outFiles%) do @(
    @if exist .\srcHeaderFiles\%%a.h (
        .\h2xml\h2xml.exe -conf .\h2xml\h2xm_config_ar.xml -I .\Inc -t Key .\srcHeaderFiles\%%a.h
    ) else (
        echo �����ڵ��ļ���%%a.h�����������ͷ�ļ�Ȼ������ִ�иó���......
    )
)

@echo.
@echo.
@echo done

pause