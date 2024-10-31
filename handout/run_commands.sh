#!/bin/bash
Write-Host "Starting now"

# Run the generate script
python -u generate.py --init_from="gpt2-medium" >> output.log 2>&1
Write-Host "done 1"


# Run the training scripts in sequence
python -u train.py --init_from="gpt2-medium" --out_dir="gpt-default-lora"
Write-Host "done 2"
python -u train.py --init_from="gpt2-medium" --out_dir="gpt-r16_a64-lora" --lora_rank=16 --lora_alpha=64
Write-Host "done 3"
python -u train.py --init_from="gpt2-medium" --out_dir="gpt-r16_a256-lora" --lora_rank=16 --lora_alpha=256
Write-Host "done 4"
python -u train.py --init_from="gpt2-medium" --out_dir="gpt-r196_a784-lora" --lora_rank=196 --lora_alpha=784
Write-Host "done 5"
python -u train.py --init_from="gpt2-medium" --out_dir="gpt-r0-lora-d.05" --lora_rank=0 --dropout=.05
Write-Host "done 6"