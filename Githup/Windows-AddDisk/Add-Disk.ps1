param(
     [Parameter(Mandatory = $true,valueFromPipeline=$true)]
            [String] $Seconds
)
###################################################################################################
# PowerShell configurations
# NOTE: Because the $ErrorActionPreference is "Stop", this script will stop on first failure.
#      This is necessary to ensure we capture errors inside the try-catch-finally block.
$ErrorActionPreference = "Stop"

# Ensure we set the working directory to that of the script.
pushd $PSScriptRoot
###################################################################################################
# Functions used in this script.
function Handle-LastError
{
   [CmdletBinding()]
   param(
   )

   $message = $error[0].Exception.Message
   if ($message)
   {
       Write-Host -Object "ERROR: $message" -ForegroundColor Red
   }

   # IMPORTANT NOTE: Throwing a terminating error (using $ErrorActionPreference = "Stop") still
   # returns exit code zero from the PowerShell script when using -File. The workaround is to
   # NOT use -File when calling this script and leverage the try-catch-finally block and return
   # a non-zero exit code from the catch block.

   exit -1
}
###################################################################################################
# Handle all errors in this script.
trap
{
   # NOTE: This trap will handle all errors. There should be no need to use a catch below in this
   #       script, unless you want to ignore a specific error.
   Handle-LastError
}
###################################################################################################
# Main execution block.

try
    {
    $acctKey = ConvertTo-SecureString -String "d8I57rNH9jvOkiDEq5yn0IUD7FwhI9eaASjO+lLfmIaF2XS8BHwHRZL8ubaoI+ljNAs8j1S+DeafAjCfY/87+g==" -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential -ArgumentList "Azure\anoclabb014581", $acctKey
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\anoclabb014581.file.core.windows.net\fileshare" -Credential $credential -Persist
    }
finally
    {
       popd
    }