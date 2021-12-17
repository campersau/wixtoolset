@setlocal
@pushd %~dp0

@set _C=Debug
:parse_args
@if /i "%1"=="release" set _C=Release
@if not "%1"=="" shift & goto parse_args

@echo Building samples %_C%

:: samples

nuget restore || exit /b

msbuild -t:Build -p:Configuration=%_C% || exit /b

@popd
@endlocal