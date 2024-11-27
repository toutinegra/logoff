@echo off
echo ======================================
echo Reiniciando o Spooler de Impressão...
echo ======================================

:: Parar o serviço de spooler
echo Parando o serviço de spooler...
net stop spooler

:: Verificar se o serviço parou corretamente
if %errorlevel% neq 0 (
    echo Erro ao parar o spooler. Verifique permissões ou dependências.
    pause
    exit /b
)

:: Opcional: Limpar arquivos pendentes na fila de impressão
echo Limpando arquivos pendentes na fila de impressão...
del /q /f "%SystemRoot%\System32\spool\PRINTERS\*.*"

:: Iniciar o serviço de spooler
echo Iniciando o serviço de spooler...
net start spooler

:: Verificar se o serviço iniciou corretamente
if %errorlevel% neq 0 (
    echo Erro ao iniciar o spooler. Verifique o serviço manualmente.
    pause
    exit /b
)

echo ======================================
echo Serviço de spooler reiniciado com sucesso!
echo ======================================
pause
