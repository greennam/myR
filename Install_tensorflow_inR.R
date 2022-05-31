install.packages("tensorflow")
library(tensorflow)
install_tensorflow()
#
# To activate this environment, use
#
#     $ conda activate r-reticulate
#
# To deactivate an active environment, use
#
#     $ conda deactivate

# installed python version : python = 3.6.12

# by NKY, add path like as
# path[1]="C:\Users\H_User\.conda\envs\rstudio
# C:\Users\H_User\AppData\Local\R-MINI~1\envs\R-RETI~1\Scripts

# You can confirm that the installation succeeded with:
library(tensorflow)
tf$constant("Hellow Tensorflow")
## tf.Tensor(b'Hellow Tensorflow', shape=(), dtype=string)

# GPU version
# install_keras(tensorflow = "gpu")

# GPU 설치전 전제 조건 3가지

# 1. Nvidai Cuda toolkit installation
# https://developer.nvidia.com/cuda-toolkit-archive

# 엔비디아 쿠디엔엔(NVIDIA cuDNN) 6 또는 6.1 설치
# # https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v6/prod/8.0_20170307/cudnn-8.0-windows10-x64-v6.0-zip
#  
# 쿠다 연산능력(CUDA Compute Capability)이 3.0 이상인 GPU 카드 확인
# # https://developer.nvidia.com/cuda-gpus

# 시스템 변수에서 CUDA_PATH, CUDA_PATH_V8_0, Path를 확인
# 환경설정
# cuDNN 압축푼후 CUDA_PATH 위치에 덮어쓰기 한다.