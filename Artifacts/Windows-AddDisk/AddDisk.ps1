
    $acctKey = ConvertTo-SecureString -String "d8I57rNH9jvOkiDEq5yn0IUD7FwhI9eaASjO+lLfmIaF2XS8BHwHRZL8ubaoI+ljNAs8j1S+DeafAjCfY/87+g==" -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential -ArgumentList "Azure\anoclabb014581", $acctKey
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\anoclabb014581.file.core.windows.net\fileshare" -Credential $credential -Persist
