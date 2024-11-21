# Verifica se o usuário logado não é Administrador
if ($env:UserName -ne "Administrador") {
    # Obter todos os processos explorer.exe em execução no sistema
    $processosExplorer = Get-WmiObject -Class Win32_Process -Filter "Name = 'explorer.exe'"

    # Iterar sobre os processos explorer.exe
    foreach ($processo in $processosExplorer) {
        # Obter o nome do usuário que está executando o processo
        $userSID = $processo.GetOwner().User
        $username = $userSID

        # Verificar se o nome do usuário é válido
        if ($username -eq $env:UserName) {
            # Se o processo explorer.exe está em execução para o usuário logado, enviar a mensagem
            $mensagem = "Digite a mensagem a ser exibida."

            try {
                # Enviar mensagem ao usuário (usando o comando 'msg')
                msg $username $mensagem
                # Dessa linha pra baixo é somente pra validação minha
                Write-Host "Mensagem enviada para o usuário: $username"
            } catch {
                Write-Host "Falha ao enviar mensagem para o usuário: $username"
            }
        }
    }
}
