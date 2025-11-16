# Create virtual environment
python -m venv .venv

# Activate it
.\.venv\Scripts\Activate.ps1

# Upgrade pip
python -m pip install --upgrade pip

# Create requirements.txt with exact versions for reproducibility
@"
torch==2.3.0
torchvision==0.18.0
torchaudio==2.3.0
--extra-index-url https://download.pytorch.org/whl/cu118
opencv-python==4.9.0.80
numpy==1.26.4
pandas==2.2.2
matplotlib==3.8.4
scikit-learn==1.4.2
tqdm==4.66.2
gradio==4.44.0
onnxruntime==1.18.0
kaggle==1.6.14
pillow==10.3.0
seaborn==0.13.2
jupyterlab==4.2.5
"@ | Out-File -Encoding UTF8 requirements.txt

# Install all
pip install -r requirements.txt

# Verify installation
python -c "import torch; print(f'PyTorch: {torch.__version__}'); print(f'CUDA available: {torch.cuda.is_available()}')"

# Create .env for secrets (Kaggle, etc.)
@"
KAGGLE_USERNAME=your_kaggle_username
KAGGLE_KEY=your_kaggle_key
"@ | Out-File -Encoding UTF8 .env

Write-Host "Environment setup complete! Activate with: .\.venv\Scripts\Activate.ps1"
