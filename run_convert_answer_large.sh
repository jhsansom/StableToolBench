cd toolbench/tooleval
export RAW_ANSWER_PATH=/home/jhsansom/data/answer
export CONVERTED_ANSWER_PATH=/home/jhsansom/data/answer_converted
export MODEL_NAME=virtual_chatgpt_cot
export test_set=G3_answer

mkdir -p ${CONVERTED_ANSWER_PATH}
answer_dir=${RAW_ANSWER_PATH}/${test_set}
output_file=${CONVERTED_ANSWER_PATH}/${test_set}.json

python convert_to_answer_format.py\
    --answer_dir ${answer_dir} \
    --method ChatGPT_DFS_woFilter_w2 \
    --output ${output_file}