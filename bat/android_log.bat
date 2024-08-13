adb wait-for-device
adb root

:: 年
@set year=%date:~0,4%
:: 月
@set month=%date:~5,2%
:: 日
@set day=%date:~8,2%
:: 时
@set hour=%time:~0,2%
:: 分
@set minute=%time:~3,2%
:: 秒
@set second=%time:~6,2%

@set outDir=out\%year%_%month%_%day%_%hour%_%minute%_%second%

@if exist %outDir% (
    echo %outDir% 目录已经存在，删除后重新创建......
    rmdir /S /Q %outDir%
) else (
    echo %outDir% 目录不存在，正在创建...... 
)

@mkdir %outDir%


:: ktcl log
adb shell tinymix > %outDir%/tinymix.log

:: dumpsys
adb shell dumpsys media.audio_flinger > %outDir%/media.audio_flinger.log
adb shell dumpsys media.audio_policy > %outDir%/media.audio_policy.log

pause

