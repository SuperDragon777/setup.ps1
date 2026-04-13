echo "Starting setup script..."

$choice = Read-Host "Do you want to run installation? (y/n)"
if ($choice -eq 'y') {
    # install scoop
    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        echo "Scoop not found, installing..."
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    } else {
        echo "Scoop already installed, skipping installation."
        scoop update
    }

    # install utils
    echo "Installing utils..."
    scoop install bat
    scoop update bat
    scoop install fastfetch
    scoop update fastfetch
    scoop install nano
    scoop update nano
    scoop install python
    scoop update python
    scoop install git
    scoop update git
    scoop install winget
    scoop update winget
    scoop install vscodium
    scoop update vscodium
    scoop install micro
    scoop update micro
	echo "Installing tooly..."
	pip install --upgrade tooly-dev
} else {
    echo "Skipping installation, proceeding to user part..."
}

# User part
Clear-Host
echo "Welcome, $env:USERNAME (SuperDragon777)"
fastfetch

echo "Script done, exiting"
exit 0