adb wait-for-device
adb root

:: ��
@set year=%date:~0,4%
:: ��
@set month=%date:~5,2%
:: ��
@set day=%date:~8,2%
:: ʱ
@set hour=%time:~0,2%
:: ��
@set minute=%time:~3,2%
:: ��
@set second=%time:~6,2%

@set outDir=out\%year%_%month%_%day%_%hour%_%minute%_%second%

@if exist %outDir% (
    echo %outDir% Ŀ¼�Ѿ����ڣ�ɾ�������´���......
    rmdir /S /Q %outDir%
) else (
    echo %outDir% Ŀ¼�����ڣ����ڴ���...... 
)

@mkdir %outDir%


:: ktcl log
adb shell tinymix > %outDir%/tinymix.log

:: dumpsys
adb shell dumpsys media.audio_flinger > %outDir%/media.audio_flinger.log
adb shell dumpsys media.audio_policy > %outDir%/media.audio_policy.log

pause

