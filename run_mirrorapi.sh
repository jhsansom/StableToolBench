export CUDA_VISIBLE_DEVICES=0,1,2,3
vllm serve stabletoolbench/MirrorAPI \
    --api-key EMPTY \
    --port 12345 \
    --tensor-parallel-size 4 \
    --gpu-memory-utilization 0.8 \
    --served-model-name mirrorapi-model