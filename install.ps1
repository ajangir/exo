# Check if Python 3.12 is installed
if ((Get-Command python3.12 -ErrorAction SilentlyContinue) -ne $null) {
    Write-Host "Python 3.12 is installed, proceeding with python3.12..."
    python3.12 -m venv .venv
} else {
    $python3Version = (python3 -V | Select-String -Pattern 'Python (\d+\.\d+)')
    Write-Host "The recommended version of Python to run exo with is Python 3.12, but $python3Version is installed. Proceeding with $python3Version"
    python3 -m venv .venv
}

# Activate the virtual environment
.venv\Scripts\Activate

# Install the project in editable mode
pip install -e .