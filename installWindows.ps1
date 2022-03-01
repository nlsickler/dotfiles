# Check if on Windows
if([environment]::OSVersion.ToString() -Match "Windows")
{
  $CurrentWindowsIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $CurrentWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($CurrentWindowsIdentity)

    # Stop script if not an admin
    if(!$CurrentWindowsPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))
    {
      Write-Host "Running on Windows requires Administrator privileges"
      return
    }
}

$ErrorActionPreference = "Stop"

$CONFIG = "windows.conf.yaml"
$DOTBOT_DIR = "dotbot"

$DOTBOT_BIN = "bin/dotbot"
$BASEDIR = $PSScriptRoot

Set-Location $BASEDIR
git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR
git submodule update --init --remote #Get latest modules/configs

foreach ($PYTHON in ('python', 'python3', 'python2')) {
# Python redirects to Microsoft Store in Windows 10 when not installed
  if (& { $ErrorActionPreference = "Continue"
      ![string]::IsNullOrEmpty((&$PYTHON -V))
      $ErrorActionPreference = "Stop" }) {
    &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $CONFIG $Args
      return
  }
}
Write-Error "Error: Cannot find Python."
