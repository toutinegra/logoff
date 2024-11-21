# Verifica se o usuário logado é Administrador ou o3cloud
if ($env:UserName -ne "Administrador" -and $env:UserName -ne "o3cloud") {
    # Obtém a lista de processos ativos na sessão do usuário
    $processes = Get-Process -IncludeUserName | Where-Object { $_.UserName -match "$env:UserName" }
    
    # Verifica se o processo explorer.exe está em execução (indicando uma sessão RDP completa)
    $explorerRunning = $processes | Where-Object { $_.ProcessName -eq "explorer" }
    
    if ($explorerRunning) {
        # Se explorer.exe estiver rodando, é uma sessão de área de trabalho completa, então desconecta
        shutdown /l
    }
}
