#LEMBRE DE TIRAR OS COMENTÁRIOS ANTES DE EXECUTAR O SCRIPT#

$currentUsername = $env:USERNAME
$raiz = "C:\Users\$currentUsername"
$destino = "LOCAL DO DESTINO DO ARQUIVO" # ENTRE ASPAS, COLOQUE O DESTINO DO SALVAMENTO #
$registroArquivo = "C:\Users\$currentUsername\log-xml-CNX.txt" # ENTRE ASPAS, COLOQUE O DESTINO DO LOG #

function Copiar-XMLsUnicos {
    if (-not (Test-Path -Path $registroArquivo)) {
        New-Item -ItemType File -Path $registroArquivo -Force | Out-Null
        Set-ItemProperty -Path $registroArquivo -Name Attributes -Value Hidden   # ESTE ATRIBUTO VAI MANTER O ARQUIVO OCULTO #
    }
    $arquivosCopiados = Get-Content -Path $registroArquivo -ErrorAction SilentlyContinue
    
    $arquivosParaCopiar = Get-ChildItem -Path $raiz -Filter *.xml -File -Recurse | Where-Object { # .XML PODE SER TROCADO POR ALGUMA OUTRA EXTENSÃO, CASO QUEIRA #
        $_.Extension -eq '.xml' -and 
        $_.BaseName -match '^\d{1,25}$' -and 
        $_.LastWriteTime -gt (Get-Date).AddMinutes(-10) -and 
        -not ($arquivosCopiados -contains $_.Name)
    }

    foreach ($arquivo in $arquivosParaCopiar) {
        try {
            $destinoArquivo = Join-Path -Path $destino -ChildPath $arquivo.Name
            Copy-Item -Path $arquivo.FullName -Destination $destinoArquivo -Force
            $logEntry = "$(Get-Date) - Arquivo: $($arquivo.Name) no Diretório: $($arquivo.DirectoryName)"
            Add-Content -Path $registroArquivo -Value $logEntry
            Write-Output "Arquivo copiado de $($arquivo.DirectoryName): $($arquivo.Name) em $(Get-Date)"
        }
        catch {
            Write-Error "Erro ao copiar o arquivo: $($arquivo.Name) de $($arquivo.DirectoryName). Mensagem de erro: $_"
        }
    }
}

while ($true) {
    Copiar-XMLsUnicos
    Start-Sleep -Seconds 120   # PODE ALTERAR A QUANTIDADE DE TEMPO PARA O SCRIPT RODAR #
}