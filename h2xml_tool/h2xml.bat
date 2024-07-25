:: 背景色：0 black; 1 bule; 2 green; 3 湖蓝色; 4 red; 5 紫色; 6 黄色; 7 白色
:: 字体色：8 灰色; 9 淡蓝色; a 淡绿色; b 淡浅绿色; c 淡红色; d 淡紫色; e 淡黄色; f 亮白色
@color 0a


:: h2xml工具目录
@set toolsDir=.\h2xml
@set outFiles=kvh2xml vcpm_api


@echo ###############################################################################
@echo #            删除已存文件
@echo ###############################################################################
@for %%a in (%outFiles%) do @(
    @if exist %%a.xml (
        echo 文件存在，删除旧文件：%%a.xml
        del /S /Q %%a.xml
    ) else (
        echo 不存在的文件：%%a.xml
    )
)

@echo.
@echo.

@echo ###############################################################################
@echo #            重新生成新的配置文件
@echo ###############################################################################
@for %%a in (%outFiles%) do @(
    @if exist .\srcHeaderFiles\%%a.h (
        .\h2xml\h2xml.exe -conf .\h2xml\h2xm_config_ar.xml -I .\Inc -t Key .\srcHeaderFiles\%%a.h
    ) else (
        echo 不存在的文件：%%a.h，请添加配置头文件然后重新执行该程序......
    )
)

@echo.
@echo.
@echo done

pause