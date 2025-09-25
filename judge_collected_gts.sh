#!/bin/bash

cd toolbench/tooleval
export API_POOL_FILE=../../openai_key.json
export CONVERTED_ANSWER_PATH=../../test_answers
export SAVE_PATH=../../test_answer_results
mkdir -p ${SAVE_PATH}
export EVAL_MODEL=gpt-4.1-mini

# Define arrays for candidate models and test sets
CANDIDATE_MODELS=(
    'chatgpt_cot'
    'claude_cot'
    'davinci_cot'
    'gpt-4-0613_cot'
    'toolllama_dfs'
    'chatgpt_dfs'
    'claude_dfs'
    'davinci_dfs'
    'gpt-4-0613_dfs'
    'toolllama_cot'
    'toolllama_dfs_retriever'
)

TEST_SETS=(
    'G1_category'
    'G1_instruction'
    'G1_tool'
    'G2_category'
    'G2_instruction'
    'G3_instruction'
)

# Loop over each candidate model
for CANDIDATE_MODEL in "${CANDIDATE_MODELS[@]}"; do
    echo "Processing candidate model: ${CANDIDATE_MODEL}"
    mkdir -p ${SAVE_PATH}/${CANDIDATE_MODEL}
    
    # Loop over each test set
    for TEST_SET in "${TEST_SETS[@]}"; do
        echo "  Testing on test set: ${TEST_SET}"
        
        python eval_pass_rate.py \
            --converted_answer_path ${CONVERTED_ANSWER_PATH} \
            --save_path ${SAVE_PATH}/${CANDIDATE_MODEL} \
            --reference_model ${CANDIDATE_MODEL} \
            --test_ids ../../solvable_queries/test_query_ids \
            --max_eval_threads 1 \
            --evaluate_times 3 \
            --test_set ${TEST_SET} \
            --overwrite
        
        # Check if the command succeeded
        if [ $? -eq 0 ]; then
            echo "  ✓ Successfully completed ${CANDIDATE_MODEL} on ${TEST_SET}"
        else
            echo "  ✗ Failed ${CANDIDATE_MODEL} on ${TEST_SET}"
        fi
    done
    
    echo "Completed all test sets for ${CANDIDATE_MODEL}"
    echo "----------------------------------------"
done

echo "All evaluations completed!"