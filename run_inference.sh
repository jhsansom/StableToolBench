export CUDA_VISIBLE_DEVICES=4,5,6,7
export LD_LIBRARY_PATH="/usr/local/cuda-12.4/targets/x86_64-linux/lib:$LD_LIBRARY_PATH"
export TOOLBENCH_KEY="EMPTY"
export OPENAI_API_BASE="EMPTY" 
export PYTHONPATH=./
export GPT_MODEL="gpt-3.5-turbo-16k"
export SERVICE_URL="http://localhost:12001/virtual"
export OUTPUT_DIR="data/answer/virtual_chatgpt_cot"
group=G1_instruction
mkdir -p $OUTPUT_DIR; mkdir -p $OUTPUT_DIR/$group

python toolbench/inference/qa_pipeline_multithread.py \
    --tool_root_dir /home/jhsansom/StableToolBench/toolenv2404_filtered \
    --backbone_model toolllama_vllm \
    --model_path toolllama \
    --base_url http://127.0.0.1:8080/v1 \
    --max_observation_length 1024 \
    --method CoT@1 \
    --input_query_file solvable_queries/test_instruction/${group}.json \
    --output_answer_file $OUTPUT_DIR/$group \
    --toolbench_key $TOOLBENCH_KEY \
    --num_thread 1